class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products
  has_many :products, through: :order_products

  def total
    product_prices = products.map(&:price)
    product_prices.inject(Money.new(0), &:+)
  end

  def email
    user.email
  end
end
