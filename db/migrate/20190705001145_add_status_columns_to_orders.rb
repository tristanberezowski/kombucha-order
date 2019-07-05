class AddStatusColumnsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :delivery_status, :string
    add_column :orders, :payment_status, :string
  end
end
