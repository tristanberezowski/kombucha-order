class RemoveDeliveryFeeFromUserExemptions < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_exemptions, :delivery_fee, :float
    remove_column :user_exemptions, :order_minimum, :float
  end
end
