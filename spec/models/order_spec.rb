require 'rails_helper'

RSpec.describe Order, type: :model do
  context "when order total less than voucher discount" do
    it "app updates total to 0 and not a negative total" do
      @order = FactoryGirl.create(:order, subtotal: "1.99", total: "1.99")
      @order.apply_discount_one
      expect(@order.update_total).to be 0
    end
  end
end
