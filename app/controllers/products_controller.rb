class ProductsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update, :destroy]

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
    @product = Product.find(params[:id])
    @address = current_user.address
    @cards = Array.new
    users_cards = current_user.cards
    users_cards.each do |card|
      customer = Payjp::Customer.retrieve(card.customer)
      @cards << customer.cards.retrieve(card.card)
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end
  
  private



  def set_product
    @product = Product.find(params[:id])
    @productsall = Product.all
  end

  

end
