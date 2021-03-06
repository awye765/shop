require 'rails_helper'

feature "FEATURE: Shopping Cart" do

  before(:each) do
    @product1 = FactoryGirl.create(:product)
  end

  scenario "can be viewed by clicking on checkout link" do
    visit '/'
    click_link '0 Items in Cart (£)'
    expect(current_path).to eq('/order')
  end

  scenario "displays the order items in an order", js: true do
    visit '/'
    click_on('Add to Cart')
    click_link '1 Items in Cart (£99.00)'
    expect(page).to have_content("Almond Toe Court Shoes")
  end

  scenario "allows user to delete item from cart", js: true do
    visit '/'
    click_on('Add to Cart')
    click_link '1 Items in Cart (£99.00)'
    click_link 'Delete'
    expect(page).to have_content("There are no items in your shopping cart.  Please go back and add some items to your cart")
  end

  scenario "does not accept a negative number for an order item", js: true do
    visit '/'
    expect(page).to have_content("Amount left: 5 in stock")

    fill_in "order_item_quantity", with: -1
    click_on('Add to Cart')

    expect(page).to have_content("Amount left: 5 in stock")
  end

end
