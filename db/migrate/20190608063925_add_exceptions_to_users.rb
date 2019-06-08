class AddExceptionsToUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :user_exemptions do |t|
      t.float :delivery_fee
      t.float :order_minimum
      t.references :user, index: true, foreign_key: true
    end
  end
end
