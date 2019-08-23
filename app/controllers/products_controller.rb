class ProductsController < ApplicationController
  require 'payjp'

  before_action :set_product, only: [:show, :edit, :update, :destroy, :purchase, :confirm, :complete]
  before_action :set_category_menu, only: [:index, :show, :search]
  before_action :set_Category, only: [:new, :create, :edit, :update]
  before_action :set_card, only: [:confirm, :complete]


  def index
    @products = Product.order(id: "DESC").limit(4)
    @products_ladies = Product.where(first_category_id: 1).order(id: "DESC").limit(4)
    @products_mens = Product.where(first_category_id: 2).order(id: "DESC").limit(4)
    @products_kids = Product.where(first_category_id: 3).order(id: "DESC").limit(4)
    @products_cosmetics = Product.where(first_category_id: 7).order(id: "DESC").limit(4)
  end

  def new
    @product = current_user.products.new
    4.times{@product.images.build}
  end

  def create
    @product = current_user.products.new(product_params)
    if @product.save
      redirect_to root_path, notice: '記事が投稿されました'
    else
      render :new
    end
  end

  def edit
    (4 - @product.images.size).times{@product.images.new}
  end

  def show
    @next = Product.where('id > ?',"#{params[:id]}").first
    @previous = Product.where('id < ?',"#{params[:id]}").last
    @product_user = @product.user
    @product_category = @product.third_category

  end

  def confirm
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
      @product.update(order_status: true, buyer_id: current_user.id)
      redirect_to complete_product_path(@product)
    else
      render :confirm
    end
  end

  def complete
  end

  def search

    @q = Product.ransack(params[:q])
    @s_products = @q.result(distinct: true).page(params[:page]).per(16)
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  def secondcategory
    @secondcategory = SecondCategory.where(first_category_id: params[:product][:first_category_id])
  end

  def thirdcategory
    @thirdcategory = ThirdCategory.where(second_category_id: params[:product][:second_category_id])
  end
  
  private
  def product_params
    params.require(:product).permit(
      :product_name,
      :description,
      :first_category_id,
      :second_category_id,
      :third_category_id,
      :size_id,
      :brand_id,
      :condition,
      :delivery_charge,
      :delivery_way,
      :delivery_date,
      :price,
      :order_status,
      :prefecture_id,
      images_attributes: [ :image, :_destroy, :id ])
  end
  
  def set_Category
    @first = FirstCategory.all
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_card
    @cards = Array.new
    users_cards = current_user.cards
    users_cards.each do |card|
      customer = Payjp::Customer.retrieve(card.customer)
      @cards << customer.cards.retrieve(card.card)
    end
  end
end
