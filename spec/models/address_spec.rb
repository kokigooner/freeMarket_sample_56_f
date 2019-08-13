require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it "has a valid factory" do
    expect(FactoryBot.build(:address, user: @user)).to be_valid
  end

  it "is invalid without a family name" do
    address = FactoryBot.build(:address, user: @user, family_name: nil)
    address.valid?
    expect(address.errors[:family_name]).to include("を入力してください")
  end

  it "is invalid without a first name" do
    address = FactoryBot.build(:address, user: @user, first_name: nil)
    address.valid?
    expect(address.errors[:first_name]).to include("を入力してください")
  end

  it "is invalid without a family name in katakana" do
    address = FactoryBot.build(:address, user: @user, family_name_kana: nil)
    address.valid?
    expect(address.errors[:family_name_kana]).to include("を入力してください")
  end

  it "is invalid when family name (kana) is not in katakana" do
    address = FactoryBot.build(:address, user: @user, family_name_kana: "めるかり")
    address.valid?
    expect(address.errors[:family_name_kana]).to include("はカナ文字を入力してください" )
  end

  it "is invalid without a first name in katakana" do
    address = FactoryBot.build(:address, user: @user, first_name_kana: nil)
    address.valid?
    expect(address.errors[:first_name_kana]).to include("を入力してください")
  end

  it "is invalid when first name (kana) is not in katakana" do
    address = FactoryBot.build(:address, user: @user, first_name_kana: "太郎")
    address.valid?
    expect(address.errors[:first_name_kana]).to include("はカナ文字を入力してください" )
  end

  it "is invalid without a postal code" do
    address = FactoryBot.build(:address, user: @user, postal_code: nil)
    address.valid?
    expect(address.errors[:postal_code]).to include("を入力してください")
  end

  it "is invalid with a postal code in a wrong format" do
    address = FactoryBot.build(:address, user: @user, postal_code: "1234567")
    address.valid?
    expect(address.errors[:postal_code]).to include("のフォーマットが不適切です")
  end

  it "is invalid without a prefecture" do
    address = FactoryBot.build(:address, user: @user, prefecture_id: nil)
    address.valid?
    expect(address.errors[:prefecture_id]).to include("を入力してください")
  end

  it "is invalid without a minicipality" do
    address = FactoryBot.build(:address, user: @user, minicipality: nil)
    address.valid?
    expect(address.errors[:minicipality]).to include("を入力してください")
  end

  it "is invalid without an address" do
    address = FactoryBot.build(:address, user: @user, address: nil)
    address.valid?
    expect(address.errors[:address]).to include("を入力してください")
  end
end
