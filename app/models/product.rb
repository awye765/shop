class Product < ActiveRecord::Base

  has_many :order_items

  has_attached_file :image, :styles => { :medium => "300x300",
                                         :thumb => "100x100"
                                       }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def remove_product_from_stock
    self.stock -= 1
    self.save
  end

  def return_product_to_stock
    self.stock += 1
    self.save
  end

end
