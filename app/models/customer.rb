class Customer < ApplicationRecord
  has_many :subscription_customers
  has_many :subscriptions, through: :subscription_customers

  validates :first_name, :last_name, :address, presence: true
  validates :email, presence: true
end
