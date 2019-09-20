class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_products
  has_many :products, through: :cart_products


  def total
    total = 0
    cart_products.each do |cart_product|
      total += cart_product.quantity * cart_product.product.price
    end
    total += self.delivery_fee
    total += self.environmental_fee
    total
  end

  def delivery_fee
    user.delivery_fee
  end

  def environmental_fee
    total = 0
    cart_products.each do |cart_product|
      total += cart_product.environmental_fee
    end
    return total
  end

end
