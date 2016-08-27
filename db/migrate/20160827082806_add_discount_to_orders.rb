class AddDiscountToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :discount, :integer
  end
end
