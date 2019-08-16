class RemoveUserFromProductExemption < ActiveRecord::Migration[5.2]
  def change
    remove_reference :product_exemptions, :user, foreign_key: true
  end
end
