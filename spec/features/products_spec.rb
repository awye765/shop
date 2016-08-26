require 'rails_helper'

feature "Products" do

  before(:each) do
    FactoryGirl.create :product
  end

  scenario 'shows first product on home-page' do
    visit '/'
    expect(page).to have_content("Almond Toe Court Shoes, Patent Black")
    expect(page).to have_content("Category: Women’s Footwear")
    expect(page).to have_content("Price: £99.0")
    expect(page).to have_content("Amount left: 5")
  end

  scenario 'shows multiple products on home-page' do
    visit '/'
    expect(page).to have_content("Almond Toe Court Shoes, Patent Black")
    expect(page).to have_content("Category: Women’s Footwear")
    expect(page).to have_content("Price: £99.0")
    expect(page).to have_content("Amount left: 5")
    expect(page).to have_content("Suede Shoes, Blue")
    expect(page).to have_content("Category: Women’s Footwear")
    expect(page).to have_content("Price: £42.0")
    expect(page).to have_content("Amount left: 4")
  end

end
