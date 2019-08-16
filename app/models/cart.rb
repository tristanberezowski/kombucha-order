class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products


  def total_price
    total = 0
    cart_products.each do |cart_product|
      total += cart_product.quantity * cart_product.product.price
    end
    total
  end
end
