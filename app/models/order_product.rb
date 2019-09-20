class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1
  }

  monetize :price_cents

  def name
    "#{quantity}x #{product.selectable.name}"
  end

  def environmental_fee
    product.environmental_fee * quantity
  end
end
