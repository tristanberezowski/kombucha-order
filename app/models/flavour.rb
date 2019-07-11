class Flavour < ApplicationRecord
  belongs_to :liquid
  validates_presence_of :name
  validates_presence_of :description

  monetize :price_cents

  def total_volume_needed(orders)
    volumes = total_volume_needed_for_orders(orders)
    total = volumes.flatten.inject(&:+)
    return total
  end

  def products
    selections = LiquidSelection.where(flavour: self)
    selections.map(&:product)
  end

  private

  def total_volume_needed_for_orders(orders)
    orders.map do |order|
      total_volume_needed_single_order(order)
    end
  end

  def volume_for(selectable)
    if (selectable.flavour == self)
      return selectable.container.volume
    else
      return 0
    end
  end

  def total_volume_needed_single_order(order)
    order.products.map do |product|
      volume_for(product.selectable)
    end
  end
end
