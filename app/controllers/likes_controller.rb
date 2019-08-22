class LikesController < ApplicationController

  def create
    @like =  Like.create(user_id: current_user.id, product_id: params[:product_id])
    @likes = Like.where(product_id: params[:product_id])
    @product = Product.find(params[:product_id])
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, product_id: params[:product_id])
    like.destroy
    @likes = Like.where(product_id: params[:product_id])
    @product = Product.find(params[:product_id])
  end
  # before_action :set_product, only: [:create, :destroy]

  # def create
  #   @like = current_user.likes.create(product_id: params[:product_id])
  #   @products = Product.all
  # end

  # def destroy
  #   like = current_user.likes.find_by(product_id: params[:product_id])
  #   like.destroy
  #   @products = Product.all
  # end

  # private

  # def set_product
  #   @product = Product.find(params[:product_id])
  # end

end
