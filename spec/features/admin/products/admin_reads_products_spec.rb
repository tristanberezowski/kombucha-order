require 'rails_helper'

feature 'Admin reads products' do
  let(:admin) { create(:admin) }

  context 'when not signed in as an admin' do
    scenario 'I should receive an unauthorized message' do
      visit admin_products_path

      expect(page).to have_content t('devise.failure.unauthenticated')
    end
  end

  context 'when signed in as an admin' do
    before do
      sign_in admin
    end

    scenario 'from the admin products page' do
      visit admin_products_path

      click_on 'New Product'

      fill_in 'Name', with: 'Bucha'
      fill_in 'Price', with: '5.00'

      check 'Purchasable'
      check 'Rentable'

      click_on 'Create Product'

      click_on 'New Product'

      fill_in 'Name', with: 'Water'
      fill_in 'Price', with: '5.00'

      check 'Purchasable'
      check 'Rentable'

      click_on 'Create Product'
      expect(page).to have_content "Bucha"
      expect(page).to have_content "Water"
      expect(page).to have_content "5.00"
    end
  end

  def sign_in(admin)
    visit new_admin_session_path

    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password

    click_on 'Log in'
  end
end
