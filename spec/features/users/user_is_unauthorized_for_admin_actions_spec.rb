require 'rails_helper'

feature 'User is unauthorized for admin actions' do
  context 'when they are not signed in' do
    scenario 'like the admin products page' do
      visit admin_products_path

      expect(page).to have_content t('devise.failure.unauthenticated')
    end
  end
end
