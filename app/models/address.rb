class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :prefecture

  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true, format: {
    with: /\A[\p{katakana}ー－]+\z/,
    message: "はカナ文字を入力してください" 
  }
  validates :first_name_kana, presence: true, format: {
    with: /\A[\p{katakana}ー－]+\z/,
    message: "はカナ文字を入力してください"
  }
  validates :postal_code, presence: true, format: {
    with: /\A\d{3}-\d{4}\z/,
    message: "のフォーマットが不適切です"
  }
  validates :prefecture_id, presence: true
  validates :minicipality, presence: true
  validates :address, presence: true
end
