class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products
  has_many :products, through: :order_products

  def total
    product_prices.inject(Money.new(0), &:+)
  end

  def email
    user.email
  end

  def add_products(cart_products)
    cart_products.each do |cart_product|
      self.order_products << OrderProduct.new(
        order: self,
        product: cart_product.product,
        quantity: cart_product.quantity,
        price: cart_product.product.price,
      )
    end
  end

  private

  def product_prices
    products.map(&:price)
  end
end
