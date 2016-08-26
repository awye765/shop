require 'rails_helper'

feature "Products" do

  before(:each) do
    Product.create(name: "Almond Toe Court Shoes",
                   colour: "Patent Black",
                   category: "Women's Footwear",
                   price: 99.00,
                   stock: 5)
  end

  scenario 'shows first product on home-page' do
    visit '/'
    expect(page).to have_content("Almond Toe Court Shoes, Patent Black")
    expect(page).to have_content("Category: Women’s Footwear")
    expect(page).to have_content("Price: £99.0")
    expect(page).to have_content("Amount left: 5")
  end

  scenario 'shows multiple products on home-page' do

    Product.create(name: "Suede Shoes",
                   colour: "Blue",
                   category: "Women’s Footwear",
                   price: 42.00,
                   quantity: 4
                  )

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
