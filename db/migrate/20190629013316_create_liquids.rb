class CreateLiquids < ActiveRecord::Migration[5.2]
  def change
    create_table :liquids do |t|
      t.string :name

      t.timestamps
    end
  end
end
