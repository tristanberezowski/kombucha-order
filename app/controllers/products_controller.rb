class ProductsController < ApplicationController
  def index
    @product_liquids = Liquid.sellable
  end
end
