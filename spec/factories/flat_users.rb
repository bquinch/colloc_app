FactoryBot.define do
  factory :flat_user do
    flat { Flat.last }
    flat_code { Flat.last.flat_code }
    user { User.last }
  end
end
