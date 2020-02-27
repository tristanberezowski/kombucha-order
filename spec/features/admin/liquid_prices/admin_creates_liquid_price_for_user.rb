require 'rails_helper'

feature 'Admin creates a liquid price for a user' do
  let!(:user) { create(:user) }
  let!(:product) { create(:product) }

  before do
    sign_in_admin
  end

  scenario 'from the show user page' do
    visit admin_user_path(user)
    click_on 'Create New Liquid Price'
    fill_in 'Price', with: 10
    select product.container.name, from: 'Container'
    select product.liquid.name, from: 'Liquid'

    click_on 'Create Liquid price'
    expect(page).to have_content t('liquid_prices.create.success')

  end
end