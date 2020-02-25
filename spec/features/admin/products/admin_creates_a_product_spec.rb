require 'rails_helper'

feature 'Admin creates a product' do
  let(:admin) { create(:admin) }

  context 'when signed in as an admin' do
    let!(:flavour) { create(:flavour) }
    let!(:container) { create(:container) }

    before do
      create(:liquid_price, container: container, liquid: flavour.liquid)
      sign_in_admin
    end

    scenario 'from the admin products page' do
      visit admin_products_path

      click_on 'New Liquid Product'

      fill_in 'Name', with: FFaker::Lorem.word
      select flavour.name, from: 'Flavour'
      select container.name, from: 'Container'

      check 'Purchasable'
      check 'Rentable'

      click_on 'Create Product'

      expect(page).to have_content t('products.create.success')
    end
  end
end
