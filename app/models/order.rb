class Order < ActiveRecord::Base
  has_many :order_items

  def update_total
    self.total = self.subtotal
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

end
git 
