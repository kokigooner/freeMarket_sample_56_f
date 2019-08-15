class ProductsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_Category, only: [:new, :create, :edit, :update]


  def toppage
  end

  def new
    @product = current_user.products.new
    @product.images.build
  end

  def create
    @product = current_user.products.new(product_params)
    @product.save!
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def products_detail
    @product   = Product.find(1)

    hash        = []
    test_model1 = {name:"コーギー1",price:"400",like:"10"}
    test_model2 = {name:"コーギー2",price:"400",like:"20"}
    test_model3 = {name:"コーギー3",price:"300",like:"30"}
    test_model4 = {name:"コーギー4",price:"400",like:"40"}
    test_model5 = {name:"コーギー3",price:"300",like:"30"}
    test_model6 = {name:"コーギー4",price:"400",like:"40"}
    @test_model = hash.push(test_model1,test_model2,test_model3,test_model4,test_model5,test_model6)
  end

  def confirm
  end
  
  private
  def product_params
    params.require(:product).permit(:product_name, :description, :first_category_id, :condition, :delivery_charge, :delivery_way, :delivery_date,:price,
      :order_status, images_attributes: [:product_image, :_destroy, :id])   
  end

  def task_params
    params.require(:task).permit(:name,:description, images: [])
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def set_Category
    @first = FirstCategory.all
  end
end