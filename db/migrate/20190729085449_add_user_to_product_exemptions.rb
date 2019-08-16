class AddUserToProductExemptions < ActiveRecord::Migration[5.2]
  def change
    add_reference :product_exemptions, :user, foreign_key: true
  end
end
