class OrderItemsController < ApplicationController

  include OrderItemsHelper

  def create
    add_quantity_of_roduct_to_cart
  end

  def destroy
    remove_quantity_of_product_from_cart
  end

end
