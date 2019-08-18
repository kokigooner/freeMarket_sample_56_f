class ProductsController < ApplicationController
  require 'payjp'

  before_action :set_product, only: [:show, :edit, :update, :destroy, :purchase, :confirm]

  def toppage
    @products   = Product.order(id: "DESC").limit(4)
    @productimage   = Image.order(id: "DESC").limit(4)
  end

  def show
    @next = Product.where('id > ?',"#{params[:id]}").first
    @previous = Product.where('id < ?',"#{params[:id]}").last
    @product_user = @product.user
  end

  def confirm
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    @address = current_user.address
    @cards = Array.new
    users_cards = current_user.cards
    users_cards.each do |card|
      customer = Payjp::Customer.retrieve(card.customer)
      @cards << customer.cards.retrieve(card.card)
    end
  end

  def purchase
    cards = current_user.cards
    card = cards[0]

    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    charge = Payjp::Charge.create(
      amount: @product.price,
      customer: card.customer,
      currency: 'jpy'
    )

    if charge["captured"]
      redirect_to root_path
    else
      render :confirm
    end
  end

  def destroy
    binding.pry
    @product.destroy
    redirect_to root_path
  end
  
  private
  def set_product
    @product = Product.find(params[:id])
  end
end
