class ProductsController < ApplicationController

  def index
    @products = Product.all
    @bid = Bid.new
  end

end
