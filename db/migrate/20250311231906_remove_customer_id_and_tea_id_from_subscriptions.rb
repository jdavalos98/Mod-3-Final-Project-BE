class RemoveCustomerIdAndTeaIdFromSubscriptions < ActiveRecord::Migration[7.1]
  def change
    remove_column :subscriptions, :customer_id, :bigint
    remove_column :subscriptions, :tea_id, :bigint
  end
end
