class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.belongs_to :order, foreign_key: true
      t.string :payee
      t.string :contact_information
      t.string :payment_method
      t.date :payment_date

      t.timestamps
    end
  end
end
