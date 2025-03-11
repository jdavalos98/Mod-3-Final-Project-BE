class SubscriptionSerializer
  include JSONAPI::SubscriptionSerializer
  attributes :title, :price, :frequency, :customers_subscribed
  
  attribute :customers, if: Proc.new { |subscription, params| params[:include_customers] == true} do |subscription|
    subscription.subscription_customers
      .include(:customer)
      .where(subscription_customers: {status: [true, false]})
      .map do |subscription_customer|
        customer = subscription_customer.customer
        {
          title: "#{customer.first_name} #{customer.last_name}",
          email: customer.email,
          status: subscription_customer.status
        }
      end
end