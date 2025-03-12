RSpec.describe "Subscription Customer Controller", type: :request do 
  before :each do 
    @subscriptions = FactoryBot.create_list(:subscription, 4)
    @customers = FactoryBot.create_list(:customer, 4)
    @subscription_customer1 = FactoryBot.create(:subscription_customer, customer: @customers[0], subscription: @subscriptions.first, status: true)
    @subscription_customer2 = FactoryBot.create(:subscription_customer, customer: @customers[1], subscription: @subscriptions.first, status: true)
    @subscription_customer3 = FactoryBot.create(:subscription_customer, customer: @customers[2], subscription: @subscriptions.first, status: true)
    @subscription_customer4 = FactoryBot.create(:subscription_customer, customer: @customers[3], subscription: @subscriptions.first, status: false)
  end

  describe 'Update Action' do 
    it 'returns updated subscription and customer_subscribed status' do 
      subscription = @subscriptions.first
      customer = @customers.first
      subscription_customer = @subscription_customer1
      initial_status = subscription_customer.status

      patch  "/api/v1/subscriptions/#{subscription.id}/subscription_customers/#{subscription_customer.id}?customer_id=#{customer.id}"

      subscription_customer.reload

      expect(response).to be_successful
      expect(response.status).to eq(200)


      json = JSON.parse(response.body, symbolize_names: true)

      # Check if the subscription data contains customers
      expect(json[:data][:attributes][:customers]).to be_an Array
      expect(json[:data][:attributes][:customers].count).to eq(4)

      # Validate the status of the first customer (should be toggled after update)
      expect(subscription_customer.status).to eq(!initial_status) 
  
      expect(json[:data][:attributes]).to include(:title)
      expect(json[:data][:attributes][:title]).to eq(@subscriptions.first.title)
      expect(json[:data][:attributes]).to include(:price)
      expect(json[:data][:attributes][:price]).to be_a String
      expect(json[:data][:attributes]).to include(:frequency)
      expect(json[:data][:attributes][:frequency]).to eq(@subscriptions.first.frequency)
      expect(json[:data][:attributes]).to include(:customers_subscribed)
      expect(json[:data][:attributes][:customers_subscribed]).to eq(2)
    end
    
    it 'creates a new record if customer has not subscribed to subscription before' do 
      subscription = @subscriptions.first
      customer = @customers.last 

      patch "/api/v1/subscriptions/#{subscription.id}/subscription_customers/999999999?customer_id=#{customer.id}"

      expect(response).to be_successful
      expect(response.status).to eq(200)
      
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data][:attributes][:customers].last[:status]).to eq(true)
    end
  end
end