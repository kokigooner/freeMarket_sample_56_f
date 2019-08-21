require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  # describe "Product#show" do
  #   let!(:product) { FactoryBot.create :product }
  #   it "create product" do
  #     expect(product).to be_valid
  #   end

  #   it "visit show" do
  #     get :show, params: {  id: product }
  #   end
  # end



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



    context 'when product searched' do

        specify do
          @params = Hash.new
          @params[:q] = Hash.new
          @params[:q]['product_name_cont_all'] = 'あああ'
          get :search, @params
          
        end
      end

end
