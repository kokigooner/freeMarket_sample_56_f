require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  # describe 'DELETE #destroy' do
  #   let!(:user) { FactoryBot.create :user }
  #   let!(:product) { FactoryBot.create :product }

  #   it 'リクエストが成功すること' do
  #     delete :destroy, params: { id: product.id }
  #     expect(response.status).to eq 302
  #   end

  #   it '商品が削除されること' do
  #     expect do
  #       delete :destroy, params: { id: product.id }
  #     end.to change(Product, :count).by(-1)
  #   end

  #   it 'トップページにリダイレクトすること' do
  #     delete :destroy, params: { id: product }
  #     expect(response).to redirect_to(root_path)
  #   end
  # end
  describe "Product" do
    #titleとcontentが入っていれば有効であること
    it "create product" do
      product = FactoryBot.build(:product)
      expect(product).to be_valid
    end

    it "visit show" do
      product = FactoryBot.build(:product)
      
      get :show, params: {  id: 1 }

    end


    



  end

end
