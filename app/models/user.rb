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
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: {
    with: VALID_EMAIL_REGIX
  }
  validates :password, presence: true
  validates :password, length: { 
    minimum: 7, 
    maximum: 128
  }
  validates :password, format: {
     with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{7,128}\z/, 
     message: "には英字と数字の両方を含めてください"
  }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
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
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_day, presence: true

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
