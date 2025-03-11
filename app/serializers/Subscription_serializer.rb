class SubscriptionSerializer
  include JSONAPI::SubscriptionSerializer
  set_type :Subscription

  attributes :title, :price, :status, :frequency
  has_many :teas
  has_many :customers
end