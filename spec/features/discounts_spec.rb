feature "FEATURE: Discounts" do

  before(:each) do
    @product1 = FactoryGirl.create(:product)
  end

  scenario "voucher code 'PRIMANI05' reduces total by £5.00 for ANY order", js: true do
    visit '/'
    page.find('.btn-primary').click
    click_link '1 Items in Cart (£99.00)'
    within('.edit_order') do
      fill_in "voucher", with: "PRIMANI05"
      click_button "Add Voucher Code"
    end
    expect(page).to have_content("1 Items in Cart (£94.00)")
  end

  scenario "voucher code 'PRIMANI10' reduces total by £10.00 IF order total is over £50.00", js: true do
    visit '/'
    page.find('.btn-primary').click
    click_link '1 Items in Cart (£99.00)'
    within('.edit_order') do
      fill_in "voucher", with: "PRIMANI10"
      click_button "Add Voucher Code"
    end
    expect(page).to have_content("1 Items in Cart (£89.00)")
  end

  scenario "voucher code 'PRIMANI15' reduces total by £15.00 IF order total is over £75 AND at least one footwear item", js: true do
    visit '/'
    page.find('.btn-primary').click
    click_link '1 Items in Cart (£99.00)'
    within('.edit_order') do
      fill_in "voucher", with: "PRIMANI15"
      click_button "Add Voucher Code"
    end
    expect(page).to have_content("1 Items in Cart (£84.00)")
  end

end
