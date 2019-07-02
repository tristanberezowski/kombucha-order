class CreateContainers < ActiveRecord::Migration[5.2]
  def change
    create_table :containers do |t|
      t.string :name
      t.integer :volume, null: false, default: 0

      t.timestamps
    end
  end
end
