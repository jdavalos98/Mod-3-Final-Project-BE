class SubscriptionTea < ApplicationRecord
  belongs_to :subscription
  belongs_to :tea

  validates :subscription_id, :tea_id, presence: true
end