class CategoriesController < ApplicationController
  before_action :set_category_menu

  def first
    category = FirstCategory.find(params[:id])
    @category_name = category.first_category
    @products = Product.where(first_category_id: params[:id]).page(params[:page]).per(130)
    render :category
  end

  def second
    category = SecondCategory.find(params[:id])
    @category_name = category.second_category
    @products = Product.where(second_category_id: params[:id]).page(params[:page]).per(130)
    render :category
  end

  def third
    category = ThirdCategory.find(params[:id])
    @category_name = category.third_category
    @products = Product.where(third_category_id: params[:id]).page(params[:page]).per(130)
    render :category
  end
end