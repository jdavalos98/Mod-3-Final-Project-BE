FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety } 
    description { Faker::Lorem.paragraph }
    temperature { Faker::Number.between(from: 150, to: 212) }
    brew_time { Faker::Number.between(from: 1, to: 5) }
  end
end