class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_products
  has_many :products, through: :cart_products


  def total_price
    products.map(&:price).inject(Money.new(0), :+)
  end
end
