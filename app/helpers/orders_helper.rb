module OrdersHelper

  def return_order
    find_order_items_for_order
    get_current_order
    update_session_order_id
  end

  def update_order_if_voucher_applies
    find_order_to_be_updated
    find_categories_for_current_order
    params.require(:order).permit!
    apply_voucher_to_order
    check_voucher_applies_to_order(@order, @categories, @voucher)
  end

  def find_order_items_for_order
    @order_items = current_order.order_items
  end

  def find_categories_for_current_order
    @categories = current_order.get_categories
  end

  def find_order_to_be_updated
    @order = Order.find(session[:order_id])
  end

  def apply_voucher_to_order
    @voucher = params[:order][:voucher]
  end

  def check_voucher_applies_to_order(order, categories, voucher)
    if voucher == "PRIMANI05"
      order.apply_discount_one
      order.update_total
      redirect_to :back
    elsif voucher == "PRIMANI10" && order.total >= 50
      order.apply_discount_two
      order.update_total
      redirect_to :back
    elsif voucher == "PRIMANI15" && order.total >= 75 && (categories.include?("Men’s Footwear") || categories.include?("Women's Footwear"))
      order.apply_discount_three
      order.update_total
      redirect_to :back
    else
      flash[:notice] = "Invalid Voucher"
      redirect_to :back
    end
  end

end
