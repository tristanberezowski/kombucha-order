class CreateOrderShippingInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :order_shipping_informations do |t|
      t.belongs_to :order, foreign_key: true
      t.string :name
      t.string :address
      t.string :city
      t.string :province
      t.string :postal
      t.string :country
      t.string :note
      t.timestamps
    end
  end
end
