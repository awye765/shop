module ProductsHelper
  def format_price
    "(£#{number_with_precision(current_order.total, precision: 2)})"
  end

end
