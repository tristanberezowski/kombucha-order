class ProductsController < ApplicationController
  def index
    @selections = Product.all.map(&:selectable)
  end
end
