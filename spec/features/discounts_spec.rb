feature "FEATURE: Discounts" do


  context "VALID voucher codes" do

    before(:each) do
      @product1 = FactoryGirl.create(:product)
    end

    context "on any order" do

      scenario "'PRIMANI05' reduces total by £5.00", js: true do
        visit '/'
        page.find('.btn-primary').click
        click_link '1 Items in Cart (£99.00)'
        within('.edit_order') do
          fill_in "voucher", with: "PRIMANI05"
          click_button "Add Voucher Code"
        end
        expect(page).to have_content("1 Items in Cart (£94.00)")
      end

    end

    context "on any order of £50.00 or more" do

      scenario "'PRIMANI10' reduces total by £10.00", js: true do
        visit '/'
        page.find('.btn-primary').click
        click_link '1 Items in Cart (£99.00)'
        within('.edit_order') do
          fill_in "voucher", with: "PRIMANI10"
          click_button "Add Voucher Code"
        end
        expect(page).to have_content("1 Items in Cart (£89.00)")
      end

    end

    context "on any order of £75.00 with at least one item of footwear" do

      scenario "'PRIMANI15' reduces total by £15.00", js: true do
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

  end

  context "VALID voucher code used on ineligible order type" do


    context "'PRIMANI10' used on order of less than £50.00" do

      scenario "returns 'Invalid Voucher' error message", js: true do
        @product2 = FactoryGirl.create(:product, price: "49.00")
        visit '/'
        page.find('.btn-primary').click
        click_link '1 Items in Cart (£49.00)'
        within('.edit_order') do
          fill_in "voucher", with: "PRIMANI20"
          click_button "Add Voucher Code"
        end
        expect(page).to have_content("Invalid Voucher")
      end

    end

    context "'PRIMANI15' used on order of less than £75.00 with footwear item" do

      scenario "returns 'Invalid Voucher' error message", js: true do
        @product3 = FactoryGirl.create(:product, price: "49.00")
        visit '/'
        page.find('.btn-primary').click
        click_link '1 Items in Cart (£49.00)'
        within('.edit_order') do
          fill_in "voucher", with: "PRIMANI15"
          click_button "Add Voucher Code"
        end
        expect(page).to have_content("Invalid Voucher")
      end

    end

    context "'PRIMANI15' used on order greater than £75.00 without footwear item" do

      scenario "returns 'Invalid Voucher' error message", js: true do
        @product4 = FactoryGirl.create(:product,
                                        price: "49.00",
                                        category: "Women's Formalwear")
        visit '/'
        page.find('.btn-primary').click
        click_link '1 Items in Cart (£49.00)'
        within('.edit_order') do
          fill_in "voucher", with: "PRIMANI15"
          click_button "Add Voucher Code"
        end
        expect(page).to have_content("Invalid Voucher")
      end

    end

  end

  context "INVALID voucher code 'PRIMANI20' is used" do

    scenario "returns 'Invalid Voucher' error message", js: true do
      @product5 = FactoryGirl.create(:product)
      visit '/'
      page.find('.btn-primary').click
      click_link '1 Items in Cart (£99.00)'
      within('.edit_order') do
        fill_in "voucher", with: "PRIMANI20"
        click_button "Add Voucher Code"
      end
      expect(page).to have_content("Invalid Voucher")
    end

  end

  context "VALID vouchers CANNOT be used in combination" do

    scenario "Only last voucher applied to total if more than one used", js: true do
      @product6 = FactoryGirl.create(:product)
      visit '/'
      page.find('.btn-primary').click
      click_link '1 Items in Cart (£99.00)'
      within('.edit_order') do
        fill_in "voucher", with: "PRIMANI05"
        click_button "Add Voucher Code"
        fill_in "voucher", with: "PRIMANI10"
        click_button "Add Voucher Code"
      end
      expect(page).to have_content("1 Items in Cart (£89.00)")
    end

  end

end
