class Flavour < ApplicationRecord
  belongs_to :liquid
  has_many :liquid_selections
  validates_presence_of :name
  validates_presence_of :description

  monetize :price_cents

  def container_count_needed(orders, container)
    containers = count_containers_for_orders(orders, container)
    total = containers.flatten.inject(&:+)
    return total
  end

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

  def count_containers_for_orders(orders, container)
    orders.map do |order|
      container_count_single_order(order, container)
    end
  end

  def container_count_single_order(order, container)
    total = 0
    order.order_products.each do |order_product|
      if order_product.product.container == container && order_product.product.flavour == self
        total += order_product.quantity
      end
    end
    total
  end

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
    order.order_products.map do |order_product|
      volume_for(order_product.product.selectable) * order_product.quantity
    end
  end
end
