class CartsController < ApplicationController
  def destroy
    @cart = Cart.find_by(id: session[:cart_id])
    @cart.destroy
    redirect_to request.referer
  end
end
