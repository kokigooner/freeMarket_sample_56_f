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
