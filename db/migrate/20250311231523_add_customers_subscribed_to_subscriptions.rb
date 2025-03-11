class AddCustomersSubscribedToSubscriptions < ActiveRecord::Migration[7.1]
  def change
    add_column :subscriptions, :customers_subscribed, :integer
  end
end
