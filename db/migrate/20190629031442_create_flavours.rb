class CreateFlavours < ActiveRecord::Migration[5.2]
  def change
    create_table :flavours do |t|
      t.belongs_to :liquid, foreign_key: true
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
