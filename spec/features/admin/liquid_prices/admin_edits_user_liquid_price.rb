require 'rails_helper'

feature 'Admin edits a users liquid price' do
  let!(:user) { create(:user) }
  let!(:product) { create(:product) }
  
  before do
    create(:liquid_price, user: user, liquid: product.liquid, container: product.container)
    sign_in_admin
  end

  scenario 'from the show user page' do
    visit admin_user_path(user)
    click_on 'Edit'
    fill_in 'Price', with: 10
    click_on 'Update Liquid price'
    expect(page).to have_content t('liquid_prices.update.success')
  end
end