FactoryGirl.define do
  factory :order_item do
    product nil
    order nil
    unit_price "9.99"
    quantity 1
    total_price "9.99"
  end
end
