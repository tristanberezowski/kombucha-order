class CreateLiquidSelections < ActiveRecord::Migration[5.2]
  def change
    create_table :liquid_selections do |t|
      t.belongs_to :flavour, foreign_key: true
      t.belongs_to :container, foreign_key: true

      t.timestamps
    end
  end
end
