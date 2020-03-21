FactoryBot.define do
  factory :flat do
    title { 'Mon Appartement' }
    description { 'Il est super' }
    address { '13 allée des Eiders' }
    flat_code { 'A123ABC' }
    user { User.first }
  end
end
