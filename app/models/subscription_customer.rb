class SubscriptionCustomer < ApplicationRecord
  belongs_to :subscription
  belongs_to :customer

  validates :subscription_id, :customer_id, presence: true
  validates :status, inclusion: { in: [true, false]}

  def self.update_status(customer_id, subscription, subscription_customer)
    if subscription_customer
      new_status = !subscription_customer.status
      subscription_customer.update!(status: new_status)
      active_subs = subscription.subscription_customers.where(status: true).count
      subscription.update!(user_subscribed: active_subs)
    else
      subscription_customer = subscription.subscription_customer.create!(
        customer_id: customer_id,
        status: true
      )
    end
    subscription_customer
  end
end