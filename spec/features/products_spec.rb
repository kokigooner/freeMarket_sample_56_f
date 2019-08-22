require 'rails_helper'

RSpec.describe '商品詳細ページテスト', type: :feature do
    let(:user_a) { FactoryBot.create(:user, nickname:'ユーザーA',email: 'a@example.com')}
    let(:user_b) { FactoryBot.create(:user, nickname:'ユーザーB',email: 'b@example.com')}
    let!(:product_a) { FactoryBot.create(:product,:skip_validate, product_name:'Aのプロダクト',user:user_a)}
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


RSpec.describe '検索機能', type: :feature do
  let(:user_a) { FactoryBot.create(:user, nickname:'ユーザーA',email: 'a@example.com')}
  let!(:product_a) { FactoryBot.create(:product,:skip_validate, product_name:'Aプロダクト',user:user_a)}
  let!(:image_a) {FactoryBot.create(:image,product:product_a)}
  let!(:product_b) { FactoryBot.create(:product,:skip_validate, product_name:'Bプロダクト',user:user_a)}
  let!(:image_b) {FactoryBot.create(:image,product:product_b)}
  let!(:product_c) { FactoryBot.create(:product,:skip_validate, product_name:'Cプロダクト',user:user_a)}
  let!(:image_c) {FactoryBot.create(:image,product:product_c)}

    before do 
    visit root_path
    fill_in '何かお探しですか？',with: search_product
    click_button 'button'
  end

  describe 'searchページ' do
    context 'Aを検索' do
          let(:search_product){"A"}
          it {expect(page).to have_content'Aプロダクト'}
          it {expect(page).to have_no_content'Bプロダクト'}
          it {expect(page).to have_no_content'Cプロダクト'}
    end

    context 'Bを検索' do
      let(:search_product){"B"}
      it {expect(page).to have_no_content'Aプロダクト'}
      it {expect(page).to have_content'Bプロダクト'}
      it {expect(page).to have_no_content'Cプロダクト'}
    end

    context 'Cを検索' do
      let(:search_product){"C"}
      it {expect(page).to have_no_content'Aプロダクト'}
      it {expect(page).to have_no_content'Bプロダクト'}
      it {expect(page).to have_content'Cプロダクト'}
    end

    context 'プロダクトを検索' do
      let(:search_product){"プロダクト"}
      it {expect(page).to have_content'Aプロダクト'}
      it {expect(page).to have_content'Bプロダクト'}
      it {expect(page).to have_content'Cプロダクト'}
    end


  end
end
