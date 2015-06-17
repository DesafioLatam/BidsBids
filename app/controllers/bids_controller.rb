class BidsController < ApplicationController

  def create
    product = Product.find(params[:product_id])
    user = current_user
    @bid = Bid.new(user: user, product: product)

    if @bid.save
      redirect_to root_path, notice: 'Tu bids ha sido creado'
    else
      redirect_to root_path, alert: 'Tu bids no ha sido creado'
    end
  end

end
