FactoryBot.define do
  factory :user do
    sequence(:email) { "#{Faker::Internet.username}-#{Time.now.to_i}-#{rand(1000)}@fileupload.com" }
    password { "password" }

    factory :user_with_files do
      transient do
        user_files_count { 5 }
      end
      after(:create) do |user, evaluator|
        create_list(:user_file, evaluator.user_files_count, user: user)
      end
    end
  end
end
