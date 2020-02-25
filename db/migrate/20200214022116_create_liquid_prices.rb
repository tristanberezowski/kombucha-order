class CreateLiquidPrices < ActiveRecord::Migration[5.2]
  def change
    create_table :liquid_prices do |t|
      t.references :liquid, foreign_key: true
      t.references :container, foreign_key: true
      t.references :user, foreign_key: true
      t.monetize :price
    end
  end
end
