class Api::V1::SubscriptionCustomersController < ApplicationController

  def update
    binding.pry
    subscription = Subscription.find_by(id: params[:subscription_id])
    customer = Customer.find_by(id: params[:customer_id])
  
    if subscription && customer
      subscription_customer = SubscriptionCustomer.update_status(params[:subscription_id], params[:customer_id], params[:status])
      render json: SubscriptionSerializer.new(subscription, {
        params: { include_customers: true, include_teas: true }
      }), status: :ok
    else
      render json: { error: 'Subscription or Customer not found' }, status: :not_found
    end
  end
  # def update
  #   subscription = Subscription.find(params[:subscription_id])
  #   sub_customer = subscription.subscription_customers.find_by(customer_id: params[:customer_id])
  #   updated_sub_status = SubscriptionCustomer.update_status(params[:customer_id], subscription, sub_customer)
  #   render json: SubscriptionSerializer.new(subscription, {
  #     params: { include_customers: true, include_teas: true }
  #   }), status: :ok
  # end
end