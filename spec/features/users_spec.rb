require 'rails_helper'

RSpec.feature "Users", type: :feature do
  scenario "sign-up for an account" do
    visit users_signup_registration_path
    expect {
      fill_in 'user_nickname', with: 'メルカリ太郎'
      fill_in 'user_email', with: 'merukari@example.com'
      fill_in 'user_password', with: 'hoge1234'
      fill_in 'user_password_confirmation', with: 'hoge1234'
      fill_in 'user_family_name', with: '田中'
      fill_in 'user_first_name', with: '太郎'
      fill_in 'user_family_name_kana', with: 'タナカ'
      fill_in 'user_first_name_kana', with: 'タロウ'
      select '2000', from: 'user_birth_year'
      select '1', from: 'user_birth_month'
      select '1', from: 'user_birth_day'
      click_on '次へ進む'
      click_on 'SMSを送信する'
      click_on '認証して完了'
      fill_in 'address_postal_code', with: '111-1111'
      select '北海道', from: 'address_prefecture'
      fill_in 'address_minicipality', with: '東京都'
      fill_in 'address_address', with: '東京1-1-1'
      click_on '次へ進む'
      click_on '次へ進む'
    }.to change(User, :count).by(1).and change(Address, :count).by(1)
  end

  scenario "does not create a new user when sign-up process is abandoned after filling in user information" do
    visit users_signup_registration_path
    expect {
      fill_in 'user_nickname', with: 'メルカリ太郎'
      fill_in 'user_email', with: 'merukari@example.com'
      fill_in 'user_password', with: 'hoge1234'
      fill_in 'user_password_confirmation', with: 'hoge1234'
      fill_in 'user_family_name', with: '田中'
      fill_in 'user_first_name', with: '太郎'
      fill_in 'user_family_name_kana', with: 'タナカ'
      fill_in 'user_first_name_kana', with: 'タロウ'
      select '2000', from: 'user_birth_year'
      select '1', from: 'user_birth_month'
      select '1', from: 'user_birth_day'
      click_on '次へ進む'
    }.to_not change(User, :count)
  end

  scenario "does not create a new user nor a new address when sign-up process is abandoned after filling in user address" do
    visit users_signup_registration_path
    expect {
      fill_in 'user_nickname', with: 'メルカリ太郎'
      fill_in 'user_email', with: 'merukari@example.com'
      fill_in 'user_password', with: 'hoge1234'
      fill_in 'user_password_confirmation', with: 'hoge1234'
      fill_in 'user_family_name', with: '田中'
      fill_in 'user_first_name', with: '太郎'
      fill_in 'user_family_name_kana', with: 'タナカ'
      fill_in 'user_first_name_kana', with: 'タロウ'
      select '2000', from: 'user_birth_year'
      select '1', from: 'user_birth_month'
      select '1', from: 'user_birth_day'
      click_on '次へ進む'
      click_on 'SMSを送信する'
      click_on '認証して完了'
      fill_in 'address_postal_code', with: '111-1111'
      select '北海道', from: 'address_prefecture'
      fill_in 'address_minicipality', with: '東京都'
      fill_in 'address_address', with: '東京1-1-1'
      click_on '次へ進む'
    }.to change(User, :count).by(0).and change(Address, :count).by(0)
  end
end
