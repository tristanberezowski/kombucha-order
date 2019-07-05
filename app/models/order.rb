class Order < ApplicationRecord
  include AASM

  belongs_to :user
  has_many :order_products
  has_many :products, through: :order_products

  aasm column: :delivery_status do
    state :undelivered, initial: true
    state :delivered

    event :deliver do
      transitions from: :undelivered, to: :delivered
    end
  end

  aasm column: :payment_status do
    state :unpaid, initial: true
    state :paid

    event :pay do
      transitions from: :unpaid, to: :paid
    end
  end


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
