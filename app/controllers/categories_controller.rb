class CategoriesController < ApplicationController
  before_action :set_category

  def first_category
    @products = Product.all
    render :category
  end

  def second_category
    @products = Product.all
    render :category
  end

  def third_category
    @products = Product.all
    render :category
  end
end