class AddPriceToFlavours < ActiveRecord::Migration[5.2]
  def change
    add_monetize :flavours, :price
  end
end
