require 'rails_helper'

feature 'Admin updates liquid prices' do
  let!(:product) { create(:product) }
  before do
    create(:liquid_price, container: product.container, liquid: product.liquid)
    sign_in_admin
  end

  scenario 'from the admin dashboard' do
    visit admin_dashboard_path
    click_on 'View Liquid Prices'
    click_on product.container.name
    fill_in 'Price', with: 50
    click_on 'Update Liquid price'
    expect(page).to have_content t('liquid_prices.update.success')
  end
end