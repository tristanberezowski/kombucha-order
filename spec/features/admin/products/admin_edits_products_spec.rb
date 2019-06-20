require 'rails_helper'

feature 'Admin updates products' do
  let(:admin) { create(:admin) }

  context 'when not signed in as an admin' do
    scenario 'I should receive an unauthorized message' do
      visit admin_products_path

      expect(page).to have_content t('devise.failure.unauthenticated')
    end
  end

  context 'when signed in as an admin' do
    let(:product) { create(:product) }

    before do
      sign_in admin
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

  def sign_in(admin)
    visit new_admin_session_path

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password

    click_on 'Log in'
  end
end
