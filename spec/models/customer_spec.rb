require 'rails_helper'

RSpec.describe Customer, type: :model do
  it {should have_many(:subscription_customers)}
  it {should have_many(:subscriptions).through(:subscription_customers)}

  it {should validate_presence_of(:first_name)}
  it {should validate_presence_of(:last_name)}
  it {should validate_presence_of(:address)}
  it {should validate_presence_of(:email)}
end
