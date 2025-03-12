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
end