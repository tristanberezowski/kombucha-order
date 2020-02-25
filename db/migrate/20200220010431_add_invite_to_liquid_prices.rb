class AddInviteToLiquidPrices < ActiveRecord::Migration[5.2]
  def change
    add_reference :liquid_prices, :invite, foreign_key: true, index: true
  end
end
