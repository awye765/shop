class OrdersController < ApplicationController

  include OrdersHelper

  def show
    @order_items = current_order.order_items
    @order = current_order
    session[:order_id] = @order.id
  end

  def update
    @order = Order.find(session[:order_id])
    @categories = current_order.get_categories
    params.require(:order).permit!
    @voucher = params[:order][:voucher]
    check_voucher(@order, @categories, @voucher)
  end

end
