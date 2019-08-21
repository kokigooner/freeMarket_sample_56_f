require 'rails_helper'

RSpec.describe '商品詳細ページテスト', type: :feature do
    let(:user_a) { FactoryBot.create(:user, nickname:'ユーザーA',email: 'a@example.com')}
    let(:user_b) { FactoryBot.create(:user, nickname:'ユーザーB',email: 'b@example.com')}
    let!(:product_a) { FactoryBot.create(:product, product_name:'Aのプロダクト',user:user_a)}
    let!(:image_a) {FactoryBot.create(:image,product:product_a)}
    

      before do 
      visit users_login_path
      fill_in 'メールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      click_button 'ログイン'
      visit product_path(product_a)
    end

    describe '詳細ページ' do
      context 'ユーザーAがログインしている時' do
            let(:login_user){user_a}
            it {expect(page).to have_content'Aのプロダクト'}
            it {expect(page).to have_no_content'購入画面に進む'}
      end
      context 'ユーザーBがログインしている時' do
        let(:login_user){user_b}
        it {expect(page).to have_content'Aのプロダクト'}
        it {expect(page).to have_content'購入画面に進む'}
      end
    end

end


