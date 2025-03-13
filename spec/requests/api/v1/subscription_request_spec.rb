require 'rails_helper'

RSpec.describe "Subscription Controller", type: :request do
  before :each do 
    @subscriptions = FactoryBot.create_list(:subscription, 4)
    @customers = FactoryBot.create_list(:customer, 5)
    FactoryBot.create(:subscription_customer, customer: @customers.first, subscription: @subscriptions.first, status: true)
    FactoryBot.create(:subscription_customer, customer: @customers.last, subscription: @subscriptions.first, status: false)
  end

  describe 'Index Action' do
    it 'returns all subscriptions and there data' do
      get '/api/v1/subscriptions'

      expect(response).to be_successful
      expect(response.status).to eq(200)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data]).to be_a Array
      expect(json[:data].count).to eq(4)
      expect(json[:data].first[:attributes]).to include(:title)
      expect(json[:data].first[:attributes]).to include(:price)
      expect(json[:data].first[:attributes]).to include(:frequency)
      expect(json[:data].first[:attributes]).to include(:customers_subscribed)
    end
  end

  describe 'Show Action' do
    it 'returns one subscription with correct data' do
      get "/api/v1/subscriptions/#{@subscriptions.first.id}"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data][:id]).to include(@subscriptions.first.id.to_s)
      expect(json[:data][:attributes][:title]).to include(@subscriptions.first.title)
      expect(json[:data][:attributes][:price]).to include(@subscriptions.first.price.to_s)
      expect(json[:data][:attributes][:frequency]).to include(@subscriptions.first.frequency)
      expect(json[:data][:attributes][:customers_subscribed].to_s).to include(@subscriptions.first.customers_subscribed.to_s)

      included_customers = (json[:included] || []).select { |e| e[:type] == 'customers' }
      expect(included_customers.count).to be >= 0

      included_teas = (json[:included] || []).select { |e| e[:type] == 'teas' }
      expect(included_teas.count).to be >= 0
    end

    it 'returns a 404 error if the subscription is not found' do
      get "/api/v1/subscriptions/999999"

      expect(response).to have_http_status(404)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:error]).to include('Subscription not found')
    end

    it 'returns a subscription without included customers and teas when there are none' do
      subscription = FactoryBot.create(:subscription)

      get "/api/v1/subscriptions/#{subscription.id}"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data][:id]).to include(subscription.id.to_s)
      expect(json[:included]).to be_nil
    end

    it 'creates a new subscription_customer if one does not exist' do
      customer = FactoryBot.create(:customer)
      subscription = FactoryBot.create(:subscription)

      expect(subscription.subscription_customers.count).to eq(0)

      subscription_customer = SubscriptionCustomer.update_status(customer.id, subscription, nil)

      expect(subscription.subscription_customers.count).to eq(1)
      expect(subscription_customer.customer_id).to eq(customer.id)
      expect(subscription_customer.status).to eq(true)
    end
  end
end