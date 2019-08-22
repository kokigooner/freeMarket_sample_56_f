class SnsCredential < ApplicationRecord
  belongs_to :user
  validates :vid, :provider, nill:false
end
