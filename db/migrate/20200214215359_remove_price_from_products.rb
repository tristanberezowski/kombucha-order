class RemovePriceFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_monetize :products, :price
  end
end
