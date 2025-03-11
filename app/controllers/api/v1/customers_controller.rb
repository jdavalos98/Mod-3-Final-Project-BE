class Api::V1::CustomerController < ApplicationController
  def index
    render json: CustomerSerializer.new(Customer.all), status :ok
  end
end