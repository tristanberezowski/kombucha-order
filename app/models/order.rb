class Order < ApplicationRecord
  belongs_to :user
  has_many :order_selections
  has_many :liquid_selections,
    through: :order_selections,
    source: :selectable,
    source_type: 'LiquidSelection'

  def selections
    liquid_selections
  end

  def total
    product_prices = selections.map(&:price)
    product_prices.inject(Money.new(0), &:+)
  end

  def email
    user.email
  end

  def add_products cart_products
    cart_products.each do |cart_product|
      self.order_selections << OrderSelection.new(
        order_id: self.id,
        selectable_type: cart_product.product.selectable_type,
        selectable_id: cart_product.product.selectable_id,
        quantity: cart_product.quantity,
      )
    end
  end
end
