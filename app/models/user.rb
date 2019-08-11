class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  has_many :sns_credentials, dependent: :destroy
  has_one :address

  validates :nickname, presence: true
  VALID_EMAIL_REGIX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGIX }
  validates :password, presence: true
  validates :password, length: { 
    minimum: 7, 
    maximum: 128, 
    message: "パスワードは7文字以上128文字以下で入力してください"
  }
  validates :password, format: {
     with: /\A(?=.*?[a-zA-Z])(?=.*?\d)\z/, 
     message: "英字と数字両方を含むパスワードを設定してください"
  }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
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
  validates :birth_year, presence: true, inclusion: { in: 1900..2019 }
  validates :birth_month, presence: true, inclusion: { in: 1..12 }
  validates :birth_day, presence: true, inclusion: { in: 1..31 }

  def self.find_for_oauth(auth)
    sns = SnsCredential.where(uid: auth.uid, provider: auth.provider).first
    unless sns
      @user = User.create(
      email:    auth.info.email,
      password: Devise.friendly_token[0,20]
      )
      sns = SnsCredential.create(
      user_id: @user.id,
      uid: auth.uid,
      provider: auth.provider
      )
    end
    sns
    @user
  end
end
