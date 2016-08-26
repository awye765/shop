feature "Orders Page" do

  before(:each) do
    @product1 = FactoryGirl.create(:product)
  end

  scenario "can be viewed by clicking on checkout link" do
    visit '/'
    click_link '0 Items in Cart ()'
    expect(current_path).to eq('/order')
  end

  scenario "displays the order items in an order", js: true do
    visit '/'
    page.find('btn-primary').click
    expect(page).to have_content("Almond Toe Court Shoes")
  end

end
