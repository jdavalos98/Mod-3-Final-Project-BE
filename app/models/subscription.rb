class Subscription < ApplicationRecord
  belongs_to :customer
  belongs_to :tea

  validates :price, :status, presence: true
end
