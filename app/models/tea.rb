class Tea < ApplicationRecord
  has_many :subscriptions

  validates :title, :temperature, presence: true
end
