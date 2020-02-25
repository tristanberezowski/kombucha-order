class LiquidPrice < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :invite, optional: true
  belongs_to :liquid
  belongs_to :container
  monetize :price_cents
end
