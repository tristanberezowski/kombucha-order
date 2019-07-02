class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates :quantity, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1
  }
end
