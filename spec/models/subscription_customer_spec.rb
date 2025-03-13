# spec/models/subscription_customer_spec.rb

require 'rails_helper'

RSpec.describe SubscriptionCustomer, type: :model do

  it { should belong_to(:subscription) }
  it { should belong_to(:customer) }


  it { should validate_presence_of(:subscription_id) }
  it { should validate_presence_of(:customer_id) }
  it { should validate_inclusion_of(:status).in_array([true, false]) }


  describe '.update_status' do
    let(:subscription) { create(:subscription) }
    let(:customer) { create(:customer) }
  
    context 'when the subscription_customer exists' do
      let(:subscription_customer) { create(:subscription_customer, subscription: subscription, customer: customer, status: true) }
  
      it 'toggles the status of the subscription_customer' do
        expect { SubscriptionCustomer.update_status(customer.id, subscription, subscription_customer) }
          .to change { subscription_customer.reload.status }.from(true).to(false)
      end
  
      it 'updates the customers_subscribed count on the subscription' do
        initial_count = subscription.customers_subscribed
        SubscriptionCustomer.update_status(customer.id, subscription, subscription_customer)
        expect(subscription.reload.customers_subscribed).to eq(initial_count - 0)
      end
    end
  
    context 'when the subscription_customer does not exist' do
      it 'creates a new subscription_customer with status true' do
        expect {
          SubscriptionCustomer.update_status(customer.id, subscription, nil)
        }.to change { subscription.subscription_customers.count }.by(1)
      end
  
      it 'sets customers_subscribed to 1 when a new subscription_customer is created' do
        initial_count = subscription.customers_subscribed
        SubscriptionCustomer.update_status(customer.id, subscription, nil)
        expect(subscription.reload.customers_subscribed).to eq(initial_count + 0)
      end
    end
  end
end