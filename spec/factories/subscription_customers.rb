FactoryBot.define do
  factory :subscription_customer do
    association :customer
    association :subscription
    status { [true, false].sample }

    after(:create) do |subscription_customer|
      subscription = subscription_customer.subscription
      active_subs = subscription.subscription_customers.where(status: true).count
      subscription.update!(customers_subscribed: active_subs)
    end
  end
end