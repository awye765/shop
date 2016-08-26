class OrderItemsController < ApplicationController
  def create
    @order = current_order
    @order_item = @order.order_items.new(order_item_params)
    @product = Product.find(@order_item.product.id)
    @order.update_total
    session[:order_id] = @order.id
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @product = Product.find(@order_item.product.id)
    @order_item.destroy
    @order_items = @order.order_items
    @order.update_total
  end

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
