FactoryBot.define do
  factory :image do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/image.jpg')) }
    product { 1 }
  end
end