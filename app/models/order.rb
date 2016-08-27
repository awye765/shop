class Order < ActiveRecord::Base

  has_many :order_items

  attr_accessor :voucher


  def update_total
    self.total = self.subtotal
    self.total = self.subtotal - self.discount
    if self.total < 0
       self.total = 0
       self.save
    else
      self.save
    end
    remove_discount
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
    products = []
    categories = []
    self.order_items.each{|orderitem| products << Product.find(orderitem.product_id)}
    products.each{|product| categories << product.category}
    return categories
  end

end
