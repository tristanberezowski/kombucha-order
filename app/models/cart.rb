class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_products
  has_many :products, through: :cart_products

  def items #Allows access to quantity and total via an array of items in the cart
    items = []
    products.each do |product|
      quantity = CartProduct.where("product_id = #{product.id} ").length
      items = items << {
        name: product.name,
        quantity: quantity,
        total: product.price * quantity
      }
    end
    items
  end
end
