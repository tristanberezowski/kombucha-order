class AddSelectableToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :selectable, polymorphic: true
  end
end
