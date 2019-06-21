require 'rails_helper'

feature 'Admin updates products' do
  let(:admin) { create(:admin) }

  context 'when signed in as an admin' do
    let(:product) { create(:product) }

    before do
      sign_in_admin admin
    end

    scenario 'from the admin product page' do
      visit admin_product_path(product)

      click_link 'Edit'

      fill_in 'Name', with: 'Kombucha'
      fill_in 'Price', with: '3.00'

      click_on 'Update Product'

      expect(page).to have_content t('products.update.success')
    end
  end
end
