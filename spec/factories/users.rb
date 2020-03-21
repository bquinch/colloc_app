FactoryBot.define do
  factory :user do
    first_name { 'Basile' }
    last_name { 'Quinchon' }
    email { Faker::Internet.email }
    password { "password"}
    password_confirmation { "password" }
    trait :with_photo do
      after :create do |account|
        file_path = Rails.root.join('spec', 'support', 'assets', 'moi.jpg')
        file = fixture_file_upload(file_path, 'image/jpg')
        account.photo.attach(file)
      end
    end
  end
end
