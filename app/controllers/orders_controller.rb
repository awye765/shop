class OrdersController < ApplicationController

  include OrdersHelper
  include OrderItemsHelper

  def show
    return_order
  end

  def update
    update_order_if_voucher_applies
  end

end
