require 'rails_helper'

RSpec.describe 'Tea Controller', type: :request do 
  before :each do 
    teas = FactoryBot.create_list(:tea, 3)
  end

  describe 'Index Action' do
    it 'returns all teas and there data' do
      get '/api/v1/teas'

      expect(response).to be_successful
      expect(response.status).to eq(200)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data]).to be_a Array
      expect(json[:data].count).to eq(3)
      expect(json[:data].first[:attributes]).to include(:title)
      expect(json[:data].first[:attributes]).to include(:description)
      expect(json[:data].first[:attributes]).to include(:temperature)
      expect(json[:data].first[:attributes]).to include(:brew_time)
    end
  end
end