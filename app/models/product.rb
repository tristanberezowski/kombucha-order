class Product < ApplicationRecord
  validates_presence_of :name, :price_cents
  monetize :price_cents
end
