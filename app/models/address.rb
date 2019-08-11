class Address < ApplicationRecord
  belongs_to :user

  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_kana, presence: true, format: {
    with: /\A[\p{katakana}ー－]+\z/,
    message: "姓カナ はカナ文字を入力してください" 
  }
  validates :first_name_kana, presence: true, format: {
    with: /\A[\p{katakana}ー－]+\z/,
    message: "名カナ はカナ文字を入力してください"
  }
  validates :postal_code, presence: true, format: {
    with: /\A\d{3}-\d{4}\z/,
    message: "フォーマットが不適切です"
  }
  validates :prefecture, presence: true
  validates :minicipality, presence: true
  validates :address, presence: true

  enum prefecture: [
    '北海道', '青森県', '岩手県', '宮城県', '秋田県',
    '山形県', '福島県', '茨城県', '栃木県', '群馬県',
    '埼玉県', '千葉県', '東京都', '神奈川県', '新潟県',
    '富山県', '石川県', '福井県', '山梨県', '長野県',
    '岐阜県', '静岡県', '愛知県', '三重県', '滋賀県',
    '京都府', '大阪府', '兵庫県', '奈良県', '和歌山県',
    '鳥取県', '島根県', '岡山県', '広島県', '山口県',
    '徳島県', '香川県', '愛媛県', '高知県', '福岡県',
    '佐賀県', '長崎県', '熊本県', '大分県', '宮崎県',
    '鹿児島県', '沖縄県'
  ]
end
