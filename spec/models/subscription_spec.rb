require 'rails_helper'

RSpec.describe Subscription, type: :model do
  
  it {should have_many(:subscription_teas)}
  it {should have_many(:teas).through(:subscription_teas)}
  it {should have_many(:subscription_customers)}
  it {should have_many(:customers).through(:subscription_customers)}

  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:frequency)}
  it {should validate_presence_of(:price)}
  it {should validate_numericality_of(:price)}
  it {should validate_presence_of(:customers_subscribed)}
  it {should validate_numericality_of(:customers_subscribed).only_integer}

  describe "callbacks" do
    it "sets default value for customer_subscribed to 0" do
      subscription = Subscription.new(title: "Test Subscription", frequency: "Monthly", price: 10.0)
      expect(subscription.customers_subscribed).to eq(0)
    end
  end
end
