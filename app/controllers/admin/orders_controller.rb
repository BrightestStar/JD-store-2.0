class Admin::OrdersController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :admin_required

  def index
    @orders = Order.order("id DESC")
  end

  def show
    @order = Order.find(params[:id])
    @product_lists = @order.product_lists
  end

  def ship
    @order = Order.find(params[:id])
    @order.ship!
    OrderMailer.notify_ship(@order).deliver!
    redirect_to request.referer
  end

  def shipped
    @order = Order.find(params[:id])
    @order.deliver!
    redirect_to request.referer
  end

  def cancel
    @order = Order.find(params[:id])
    @order.cancel_order!
    OrderMailer.notify_cancel(@order).deliver!
    redirect_to request.referer
  end

  def return
    @order = Order.find(params[:id])
    @order.return_good!
    redirect_to request.referer
  end
end
