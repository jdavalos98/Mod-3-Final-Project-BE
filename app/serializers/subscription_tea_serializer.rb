class SubscriptionTeaSerializer
  include JSONAPI::TeaSerializer
  belongs_to :subscription
  belongs_to :tea
end