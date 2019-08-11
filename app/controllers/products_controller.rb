class ProductsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def toppage
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

  def task_params
    params.require(:task).permit(:name,:description, images: [])
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

end
