FactoryBot.define do
  factory :user do
    sequence(:email) { "#{Faker::Internet.username}-#{Time.now.to_i}-#{rand(1000)}@fileupload.com" }
    password { "password" }
  end
end
