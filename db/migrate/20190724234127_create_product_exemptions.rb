class CreateProductExemptions < ActiveRecord::Migration[5.2]
  def change
    create_table :product_exemptions do |t|
      t.belongs_to :product, foreign_key: true
      t.monetize :fee

      t.timestamps
    end
  end
end
