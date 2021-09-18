include ActionDispatch::TestProcess

FactoryBot.define do
  factory :user_file do
    files { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'test.jpg')) }
    user { create(:user) }
  end
end
