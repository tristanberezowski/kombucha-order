class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.boolean :rentable
      t.boolean :purchasable

      t.timestamps
    end
  end
end
