class CustomerSerializer
  include JSONAPI::Serializer

  attributes :first_name, :last_name, :email, :address

  attributes :subscriptions do |customer|
    customer.subscription_customers
      .includes(:subscription)
      .where(subscription_customers: {status: true})
      .map do |subscriptions_customer|
        subscription = subscription_customers.subscription
        {
          id: subscription.id,
          title: subscription.title
        }
      end
  end
end