class OrderSelection < ApplicationRecord
  belongs_to :order
  belongs_to :selectable, polymorphic: true
end
