require 'rails_helper'

feature 'FEATURE: Stock' do

  before(:all) do
    @product1 = FactoryGirl.create(:product, stock: 0)
  end

  context "when 0 stock for an item" do
    it 'should say out "out of stock" if there is no stock' do
      visit '/'
      expect(page).to have_content 'out of stock'
    end

  end


end
