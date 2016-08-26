feature "Orders Page" do

  before do
    @product1 = FactoryGirl.create(:product)
  end

  scenario "can be viewed by clicking on checkout link" do
    visit '/'
    click_link '0 Items in Cart ( )'
    expect(current_path).to eq('/order')
  end

  scenario "displays the order items in an order", js: true do
    visit '/'
    page.find('btn-primary').click
    click_link '1 Items in Cart ( 99.0 )'
    expect(page).to have_content("Almond Toe Court Shoes")
  end

end
