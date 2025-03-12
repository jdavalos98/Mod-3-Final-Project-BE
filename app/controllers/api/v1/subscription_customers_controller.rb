class Api::V1::SubscriptionCustomersController < ApplicationController
  def update
    subscription = Subscription.find(params[:subscription_id])
    sub_customer = subscription.subscription_customers.find_by(customer_id: params[:customer_id])
    updated_sub_status = SubscriptionCustomer.update_status(params[:customer_id], subscription, sub_customer)
    render json: SubscriptionSerializer.new(subscription, {
      params: { include_customers: true, include_teas: true }
    }), status: :ok
  end
end