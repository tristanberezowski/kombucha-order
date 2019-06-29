class Flavour < ApplicationRecord
  belongs_to :liquid
  validates_presence_of :name
  validates_presence_of :description
end
