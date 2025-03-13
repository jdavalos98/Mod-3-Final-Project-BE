FactoryBot.define do
  factory :subscription do
    title { "Monthly Green Tea" }
    price { 19.99 }
    frequency { "Monthly" }
    customers_subscribed { 0 } 

    after(:create) do |subscription|
      subscription.update!(customers_subscribed: subscription.subscription_customers.where(status: true).count)
    end
  end
end