require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  it "is invalid without a nickname" do
    user = FactoryBot.build(:user, nickname: nil)
    user.valid?
    expect(user.errors[:nickname]).to include("can't be blank")
  end

  it "is invalid without an email" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid with a duplicate email" do
    FactoryBot.create(:user, email: "test@example.com")
    user = FactoryBot.build(:user, email: "test@example.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  it "is invalid with an invalid email" do
    user = FactoryBot.build(:user, email: "plainaddress")
    user.valid?
    expect(user.errors[:email]).to include("is invalid")
  end

  it "is invalid without a password" do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it "is invalid when the password is too short" do
    user = FactoryBot.build(:user, password: "hoge12")
    user.valid?
    expect(user.errors[:password]).to include("パスワードは7文字以上128文字以下で入力してください")
  end

  it "is invalid when the password is too long" do
    user = FactoryBot.build(:user, password: "A12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678")
    user.valid?
    expect(user.errors[:password]).to include("パスワードは7文字以上128文字以下で入力してください")
  end

  it "is invalid with a password only with alphabets" do
    user = FactoryBot.build(:user, password: "abcdefgh")
    user.valid?
    expect(user.errors[:password]).to include("英字と数字両方を含むパスワードを設定してください")
  end

  it "is invalid with a password only with numbers" do
    user = FactoryBot.build(:user, password: "12345678")
    user.valid?
    expect(user.errors[:password]).to include("英字と数字両方を含むパスワードを設定してください")
  end

  it "is invalid without a password confirmation" do
    user = FactoryBot.build(:user, password_confirmation: nil)
    user.valid?
    expect(user.errors[:password_confirmation]).to include("can't be blank")
  end

  it "is invalid when the confirmed password doesn't match" do
    user = FactoryBot.build(:user, password: "hoge1234", password_confirmation: "huga5678")
    user.valid?
    expect(user.errors[:password_confirmation]).to include("doesn't match Password")
  end

  it "is invalid without a family name" do
    user = FactoryBot.build(:user, family_name: nil)
    user.valid?
    expect(user.errors[:family_name]).to include("can't be blank")
  end

  it "is invalid without a first name" do
    user = FactoryBot.build(:user, first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end

  it "is invalid without a family name in katakana" do
    user = FactoryBot.build(:user, family_name_kana: nil)
    user.valid?
    expect(user.errors[:family_name_kana]).to include("can't be blank")
  end

  it "is invalid when family name (kana) is not in katakana" do
    user = FactoryBot.build(:user, family_name_kana: "めるかり")
    user.valid?
    expect(user.errors[:family_name_kana]).to include("姓カナはカナ文字を入力してください" )
  end

  it "is invalid without a first name in katakana" do
    user = FactoryBot.build(:user, first_name_kana: nil)
    user.valid?
    expect(user.errors[:first_name_kana]).to include("can't be blank")
  end

  it "is invalid when first name (kana) is not in katakana" do
    user = FactoryBot.build(:user, first_name_kana: "太郎")
    user.valid?
    expect(user.errors[:first_name_kana]).to include("名カナはカナ文字を入力してください" )
  end

  it "is invalid without a birthyear" do
    user = FactoryBot.build(:user, birth_year: nil)
    user.valid?
    expect(user.errors[:birth_year]).to include("can't be blank")
  end

  it "is invalid without a birthmonth" do
    user = FactoryBot.build(:user, birth_month: nil)
    user.valid?
    expect(user.errors[:birth_month]).to include("can't be blank")
  end

  it "is invalid without a birthday" do
    user = FactoryBot.build(:user, birth_day: nil)
    user.valid?
    expect(user.errors[:birth_day]).to include("can't be blank")
  end

end
