require 'rails_helper'

feature 'Admin creates a product' do
  let(:admin) { create(:admin) }

  context 'when signed in as an admin' do
    before do
      sign_in_admin admin
    end

    scenario 'from the admin products page' do
      visit admin_products_path

      click_on 'New Product'

      fill_in 'Name', with: FFaker::Lorem.word
      fill_in 'Price', with: '5.00'

      check 'Purchasable'
      check 'Rentable'

      click_on 'Create Product'

      expect(page).to have_content t('products.create.success')
    end
  end
end
