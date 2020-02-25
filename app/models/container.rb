class Container < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :volume
  has_many :liquid_prices
  monetize :price_cents
  monetize :environmental_fee_cents
end
