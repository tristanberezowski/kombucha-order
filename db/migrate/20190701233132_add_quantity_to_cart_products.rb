class AddQuantityToCartProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_products, :quantity, :integer, null: false, default: 1
  end
end
