class Liquid < ApplicationRecord
  validates_presence_of :name
  has_many :flavours
  has_many :liquid_prices

  def containers_count
    products = []
    flavours = self.flavours
    flavours.each do |flavour|
      products << flavour.products
    end
    
    containers = products.flatten.map do |product|
      product.container
    end
    containers.uniq.count
  end
end
