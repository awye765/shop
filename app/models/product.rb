class Product < ActiveRecord::Base

  has_many :order_items

  default_scope { order('id ASC') }

  has_attached_file :image, :styles => { :medium => "300x300",
                                         :thumb => "100x100"
                                       }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
