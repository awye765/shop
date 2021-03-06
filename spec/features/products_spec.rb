require 'rails_helper'

feature "FEATURE: Products Index" do

  before(:each) do
    @product1 = FactoryGirl.create(:product)
  end

  context "when only one product for sale" do

    scenario 'shows one product on homepage' do
      visit '/'
      expect(page).to have_content("Almond Toe Court Shoes")
      expect(page).to have_content("Patent Black")
      expect(page).to have_content("Category: Women's Footwear")
      expect(page).to have_content("Price: £99.0")
      expect(page).to have_content("Amount left: 5")
    end

  end

  context "when mulitple products for sale" do

    scenario 'shows multiple products on homepage' do
      @product2 = FactoryGirl.create(:product, name: "Suede Shoes",
      colour: "Blue",
      category: "Women's Footwear",
      price: "42.0",
      stock: 4,
      image: Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/almond_toe_court_shoes.png', 'image/png')
      )
      visit '/'
      expect(page).to have_content("Almond Toe Court")
      expect(page).to have_content("Shoes")
      expect(page).to have_content("Patent Black")
      expect(page).to have_content("Category: Women's Footwear")
      expect(page).to have_content("Price: £99.0")
      expect(page).to have_content("Amount left: 5")

      expect(page).to have_content("Suede Shoes")
      expect(page).to have_content("Blue")
      expect(page).to have_content("Category: Women's Footwear")
      expect(page).to have_content("Price: £42.0")
      expect(page).to have_content("Amount left: 4")
    end

  end

end
