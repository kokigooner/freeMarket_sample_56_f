require 'rails_helper'

describe Sns_credential do
  describe '#create' do
    it "is valid with a provider, uid, user_id" do
       = build(:sns_credential)
      expect(sns_credential).to be_valid
    end
  end
end