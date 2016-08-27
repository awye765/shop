module OrdersHelper

  def check_voucher(order, categories, voucher)
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
