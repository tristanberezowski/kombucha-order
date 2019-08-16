class ProductExemption < ApplicationRecord
  belongs_to :product
  monetize :fee_cents
end
