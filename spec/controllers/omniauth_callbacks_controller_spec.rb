require "rails_helper"

feature "omniauthfeature" do

  feature "facebook連携でサインアップする" do
    background do
      OmniAuth.config.mock_auth[:facebook] = nil
      Rails.application.env_config['omniauth.auth'] = facebook_mock
    end

    scenario "facebookで登録するを押すと登録フォームに遷移する" do
      visit('/users/new')
      find(".signup__form__btn--facebook").click
      expect(current_path).to eq users_signup_registration_path
    end

    scenario "DBに情報がない場合Facebookでログインを押しても登録フォームに遷移する" do
      visit('/users/login')
      click_link 'Facebookでログイン'
      expect(current_path).to eq users_signup_registration_path
    end
  end

  feature "google連携でサインアップする" do
    background do
      OmniAuth.config.mock_auth[:google] = nil
      Rails.application.env_config['omniauth.auth'] = google_mock
    end

    scenario "googleで登録するを押すと登録フォームに遷移する" do
      visit('/users/new')
      find(".signup__form__btn--google").click
      expect(current_path).to eq users_signup_registration_path
    end

    scenario "DBに情報がない場合Googleでログインを押しても登録フォームに遷移する" do
      visit('/users/login')
      click_link 'Googleでログイン'
      expect(current_path).to eq users_signup_registration_path
    end
  end
end