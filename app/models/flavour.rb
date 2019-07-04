class Flavour < ApplicationRecord
  belongs_to :liquid
  validates_presence_of :name
  validates_presence_of :description

  monetize :price_cents

  def total_volume_needed(orders)
    volumes = []
    orders.each do |order|
      volumes << total_volume_needed_single_order(order)
    end
    total = volumes.flatten.inject(&:+)
  end

  private

  def volume_for(product)
    if (product.selectable.flavour == self)
      return product.selectable.container.volume
    else
      return 0
    end
  end

  def total_volume_needed_single_order(order)
    volumes = []
    order.products.each do |product|
      volumes << volume_for(product)
    end
    volumes
  end

end