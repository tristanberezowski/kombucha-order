class ProductsController < ApplicationController
  def index
    @products = Product.all
    @selections = @products.map(&:selectable)
    @liquids = @selections.map(&:liquid).uniq
    @flavours = @selections.map(&:flavour).uniq
  end
end
