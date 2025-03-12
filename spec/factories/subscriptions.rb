FactoryBot.define do
  factory :subscription do
    title { Faker::Commerce.product_name }
    price { Faker::Commerce.price(range: 1..100.0, as_string: true) }
    frequency { Faker::Commerce.material }
    customers_subscribed { Faker::Number.between(from: 1, to: 100) }
  end
end