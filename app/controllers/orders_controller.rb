class OrdersController < ApplicationController
  def show
    @order_items = current_order.order_items
    @order = current_order
    session[:order_id] = @order.id
  end
end
