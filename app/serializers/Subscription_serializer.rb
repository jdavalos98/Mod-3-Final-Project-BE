class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :title, :price, :frequency, :customers_subscribed
  
  attribute :customers, if: Proc.new { |subscription, params| params[:include_customers] == true } do |subscription|
    subscription.subscription_customers
      .includes(:customer)
      .where(subscription_customers: {status: [true, false]})
      .map do |subscription_customer|
        customer = subscription_customer.customer
        {
          id: customer.id,
          title: "#{customer.first_name} #{customer.last_name}",  # Corrected interpolation here
          email: customer.email,
          status: subscription_customer.status
        }
      end
  end
  
  attribute :teas do |object, params|
    if params[:include_teas]
      object.teas
    end
  end
end