require 'rails_helper'

RSpec.describe Card, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:card)).to be_valid
  end

  it "is invalid without a user" do
    card = FactoryBot.build(:card, user: nil)
    card.valid?
    expect(card.errors[:user]).to include("を入力してください")
  end

  it "is invalid without a card id" do
    card = FactoryBot.build(:card, card: nil)
    card.valid?
    expect(card.errors[:card]).to include("を入力してください")
  end

  it "is invalid without a invalid card id" do
    card = FactoryBot.build(:card, card: "car_cdd34bed2g153e06cdf645471872")
    card.valid?
    expect(card.errors[:card]).to include("のフォーマットが不適切です")
  end

  it "is invalid without a customer id" do
    card = FactoryBot.build(:card, customer: nil)
    card.valid?
    expect(card.errors[:customer]).to include("を入力してください")
  end

  it "is invalid without a invalid customer id" do
    card = FactoryBot.build(:card, customer: "cus_9735caff3170g34d5c534cc72c90")
    card.valid?
    expect(card.errors[:customer]).to include("のフォーマットが不適切です")
  end



end
