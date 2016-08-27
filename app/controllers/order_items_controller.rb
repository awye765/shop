class OrderItemsController < ApplicationController

  def create
    @order = current_order
    @order.discount = 0
    @order_item = @order.order_items.new(order_item_params)
    @product = Product.find(@order_item.product.id)
    @product.remove_product_from_stock
    @order.update_total
    session[:order_id] = @order.id
  end

  # def update
  #    @order = current_order
  #    @order_item = @order.order_items.find(params[:id])
  #    @order_item.update_attributes(order_item_params)
  #    @order_items = @order.order_items
  #  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @product = Product.find(@order_item.product.id)
    @product.return_product_to_stock
    @order_item.destroy
    @order_items = @order.order_items
    @order.update_total
  end

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end

end
