class OrderItem < ActiveRecord::Base
  
  belongs_to :product
  belongs_to :order

  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      product.price
    end
  end

  def total_price
    unit_price * quantity
  end

  def finalize
    finalize_unit_price
    finalize_total_price
  end

  def finalize_unit_price
    self[:unit_price] = unit_price
  end

  def finalize_total_price
    self[:total_price] = quantity * self[:unit_price]
  end

end
