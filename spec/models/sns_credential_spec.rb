require 'rails_helper'
RSpec.describe User, type: :model do
  it "has a vaild facory" do
    expect(FactoryBot.build(:sns_credential)).to be_valid
  end

  it "is invalid without a provider" do
    sns_credential = FactoryBot.build(:sns_credential, provider: nil)
    sns_credential.valid?
    except
  end
end