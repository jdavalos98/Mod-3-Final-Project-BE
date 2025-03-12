class Subscription < ApplicationRecord
  has_many :subscription_teas
  has_many :teas, through: :subscription_teas
  has_many :subscription_customers
  has_many :customers, through: :subscription_customers

  validates :title, :frequency, presence: true
  validates :price, presence: true, numericality: true
  validates :customers_subscribed, presence: true, numericality: {only_integer: true}

  after_initialize :set_default_user_subscribed, if: :new_record?

  def set_default_user_subscribed
    self.user_subscribed ||= 0
  end
end
