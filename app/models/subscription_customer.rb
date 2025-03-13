class SubscriptionCustomer < ApplicationRecord
  belongs_to :subscription
  belongs_to :customer

  validates :subscription_id, :customer_id, presence: true
  validates :status, inclusion: { in: [true, false] }

  def self.update_status(subscription_id, customer_id, new_status)
    subscription_customer = find_by(subscription_id: subscription_id, customer_id: customer_id)

    if subscription_customer
      subscription_customer.update!(status: new_status)
    else
      subscription = Subscription.find(subscription_id)
      subscription_customer = create!(
        subscription_id: subscription_id,
        customer_id: customer_id,
        status: new_status
      )
    end
    subscription_customer.subscription.update(
      customers_subscribed: subscription_customer.subscription.subscription_customers.where(status: true).count
    )
    subscription_customer
  end

  
  # def self.update_status(customer_id, subscription, subscription_customer)
  #   if subscription_customer
  #     new_status = !subscription_customer.status
  #     subscription_customer.update!(status: new_status)
  #     active_subs = subscription.subscription_customers.where(status: true).count
  #     subscription.update!(customers_subscribed: active_subs)
  #   else
  #     subscription_customer = subscription.subscription_customers.create!(
  #       customer_id: customer_id,
  #       status: true
  #     )
  #   end
  #   subscription_customer
  # end
end