class AddDeliveryDateToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :delivery_date, :datetime
  end
end
