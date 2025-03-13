class Api::V1::SubscriptionsController < ApplicationController
  def index
    render json: SubscriptionSerializer.new(Subscription.all), status: :ok
  end

  def show
    subscription = Subscription.find(params[:id])
    render json: SubscriptionSerializer.new(subscription)
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Subscription not found' }, status: :not_found
  end
end