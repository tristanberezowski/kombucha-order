class CreateOrderSelections < ActiveRecord::Migration[5.2]
  def change
    create_table :order_selections do |t|
      t.belongs_to :order, foreign_key: true
      t.belongs_to :selectable, polymorphic: true

      t.timestamps
    end
  end
end
