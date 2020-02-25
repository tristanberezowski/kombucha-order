require 'rails_helper'

feature 'Admin updates products' do
  let(:admin) { create(:admin) }

  context 'when signed in as an admin' do
    let(:product) { create(:product) }

    before do
      create(:liquid_price, container: product.container, liquid: product.liquid)
      sign_in_admin
    end

    scenario 'from the admin product page' do
      visit admin_product_path(product)

      click_link 'Edit'

      fill_in 'Name', with: 'Kombucha 1L Growler'

      click_on 'Update Product'

      expect(page).to have_content t('products.update.success')
    end
  end
end
