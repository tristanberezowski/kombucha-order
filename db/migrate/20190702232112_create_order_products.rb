class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.belongs_to :order, foreign_key: true
      t.belongs_to :product, foreign_key: true
      t.integer :quantity, null: false, default: 1
      t.monetize :price

      t.timestamps
    end
  end
end
