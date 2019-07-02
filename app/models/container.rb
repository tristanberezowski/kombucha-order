class Container < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :volume
  monetize :price_cents
end
