class CategoriesController < ApplicationController
  before_action :set_category_menu

  def first
    @products = Product.where(first_category_id: params[:id]).page(params[:page]).per(130)
    render :category
  end

  def second
    @products = Product.where(second_category_id: params[:id]).page(params[:page]).per(130)
    render :category
  end

  def third
    @products = Product.where(third_category_id: params[:id]).page(params[:page]).per(130)
    render :category
  end
end