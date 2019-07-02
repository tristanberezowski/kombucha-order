class AddQuantityToOrderSelections < ActiveRecord::Migration[5.2]
  def change
    add_column :order_selections, :quantity, :integer, null: false, default: 1
  end
end
