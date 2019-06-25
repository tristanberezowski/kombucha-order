class CreateOrderBillingInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :order_billing_informations do |t|
      t.belongs_to :order, foreign_key: true
      t.string :name
      t.string :address
      t.string :city
      t.string :province
      t.string :postal
      t.string :country
      t.timestamps
    end
  end
end
