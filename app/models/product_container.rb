class ProductContainer < ApplicationRecord
  belongs_to :product
  belongs_to :container
end
