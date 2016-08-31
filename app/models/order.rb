class Order < ActiveRecord::Base

  has_many :order_items

  attr_accessor :voucher

  def update_total
    update_total_to_subtotal
    update_total_after_applicable_discount
    validate_total_greater_than_zero
    remove_discount
  end

  def update_total_to_subtotal
    self.total = self.subtotal
  end

  def update_total_after_applicable_discount
    self.total = self.subtotal - self.discount
  end

  def validate_total_greater_than_zero
    if self.total < 0
       self.total = 0
       self.save
    else
      self.save
    end
  end

  def subtotal
    self.subtotal = order_items.collect { |oi| oi.quantity * oi.unit_price }.sum
  end

  def apply_discount_one
    self.discount = 5
  end

  def apply_discount_two
    self.discount = 10
  end

  def apply_discount_three
    self.discount = 15
  end

  def remove_discount
    self.discount = 0
  end

  def get_categories
    find_product_associated_with_order_item
    find_product_category_associated_with_product
    return @categories
  end

  def find_product_associated_with_order_item
    @products = []
    self.order_items.each{|orderitem| @products << Product.find(orderitem.product_id)}
  end

  def find_product_category_associated_with_product
    @categories = []
    @products.each{|product| @categories << product.category}
  end

end
