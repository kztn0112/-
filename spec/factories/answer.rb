FactoryBot.define do
  factory :answer do
    content { Faker::Lorem.characters(number:30) }
  end
end