class AddEnvironmentalFeeToContainers < ActiveRecord::Migration[5.2]
  def change
    add_monetize :containers, :environmental_fee 
  end
end
