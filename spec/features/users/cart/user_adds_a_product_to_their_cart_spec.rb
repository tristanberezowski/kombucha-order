require 'rails_helper'

feature 'User adds a product to their cart' do
  let!(:product) { create(:product) }

  before do
    create(:liquid_price, container: product.container, liquid: product.liquid)
    sign_in_user
  end

  scenario 'from the product index' do
    visit products_path

    click_on 'Add to Cart'

    expect(page).to have_content t('cart_products.create.success')

    visit cart_path

    expect(page).to have_content product.name
  end
end
