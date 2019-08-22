require 'rails_helper'

RSpec.describe ProductsController, type: :show do

  describe 'DELETE #destroy' do

    it "assigns the requested tweet to @tweet" do
      product = create(:product)
      get :show, params: { id: product }
    end

  end
end