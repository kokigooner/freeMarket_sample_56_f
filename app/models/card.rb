class Card < ApplicationRecord
  belongs_to :user

  validates :customer, presence: true
  validates :customer, format: {
    with: /\Acus_[a-f\d]+\z/
  }
  validates :card, presence: true
  validates :card, format: {
    with: /\Acar_[a-f\d]+\z/
  }

end
