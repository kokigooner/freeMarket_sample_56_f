class ProductsController < ApplicationController

  before_action :set_product, only: [:products_detail, :edit, :update, :destroy]

  def toppage
    @products   = Product.order(id: "DESC").limit(4)
    @productimage   = Image.order(id: "DESC").limit(4)
  end

  def products_detail
    
    @next = Product.find_by_id("#{params[:id].to_i + 1}")
    @previous = Product.find_by_id("#{params[:id].to_i - 1}")
    @product_user = @product.user
  end

  def confirm
  end

  def delete
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path
  end
  
  private



  def set_product
    @product = Product.find(params[:id])
    @productsall = Product.all
  end

  

end
