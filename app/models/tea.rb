class Tea < ApplicationRecord
  has_many :subscription_teas
  has_many :subscriptions, through: :subscription_teas



  validates :title, :description, presence: true
  validates :temperature, presence: true, numericality: { only_integer: true}
  validates :brew_time, presence: true, numericality: { only_integer: true}
end
