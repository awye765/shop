module OrderItemsHelper

  def add_quantity_of_roduct_to_cart
    get_current_order
    create_new_order_item
    set_discount_to_zero_initially
    save_order
    associate_product_with_order_item
    remove_product_from_stock
    update_order_total
    update_session_order_id
    index_all_products
  end

  def remove_quantity_of_product_from_cart
    get_current_order
    find_current_order_item
    find_product_details_for_order_item
    return_product_to_stock
    remove_order_item_from_order
    update_order_items_in_order
    update_order_total
  end

  def index_all_products
    @products = Product.all
  end

  def update_session_order_id
    session[:order_id] = @order.id
  end

  def associate_product_with_order_item
    @product = @order_item.product
  end

  def find_product_details_for_order_item
    @product = Product.find(@order_item.product.id)
  end

  def update_order_total
    @order.update_total
  end

  def remove_order_item_from_order
    @order_item.destroy
  end

  def update_order_items_in_order
    @order_items = @order.order_items
  end

  def save_order
    @order.save
  end

  def set_discount_to_zero_initially
    @order.discount = 0
  end

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end

  def get_current_order
    @order = current_order
  end

  def remove_product_from_stock
    @product.update_attributes(stock: (@product.stock - @order_item.quantity))
  end

  def return_product_to_stock
    @order_item.product.update_attributes(stock: (@order_item.product.stock + @order_item.quantity))
  end

  def find_current_order_item
    @order_item = @order.order_items.find(params[:id])
  end

  def create_new_order_item
    @order_item = @order.order_items.new(order_item_params)
  end

end
