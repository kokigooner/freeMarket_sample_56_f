require 'rails_helper'

RSpec.feature "Sns_credentials", type: :feature do
  scenario "新規登録したら追加される" do
    expect {
      click_on 'facebookで登録する'
    }.to change(Sns_credential).by(1)
  end
end