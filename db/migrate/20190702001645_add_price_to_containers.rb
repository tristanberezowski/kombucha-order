class AddPriceToContainers < ActiveRecord::Migration[5.2]
  def change
    add_monetize :containers, :price
  end
end
