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

  # scenario "allows user to increase the quantity of an item in the cart", js: true do
  #   visit '/'
  #   click_on('Add to Cart')
  #   click_link '1 Items in Cart (£99.00)'
  #   fill_in "order_item_quantity", with: '2'
  #   click_on('Update Quantity')
  #   expect(page).to have_content("Total Price for 2 Items: £198.00")
  # end

end
