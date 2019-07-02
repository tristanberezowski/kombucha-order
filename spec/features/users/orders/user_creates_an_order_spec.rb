require 'rails_helper'

feature 'User creates an order' do
  let(:keg) { create(:keg) }
  let(:growler) { create(:growler) }
  let(:selection) { create(:liquid_selection, container: growler) }
  let(:product) { create(:product, price: Money.new(500), selectable: selection) }

  before do
    create(:product_container, product: product, container: keg)
    create(:product_container, product: product, container: growler)
    sign_in_user
  end

  scenario 'by saving it for later' do
    visit products_path

    within ".product-#{product.id}" do
      fill_in 'Quantity', with: '2'
      click_on 'Add to Cart'
    end

    within '.navigation' do
      click_on 'Cart'
    end

    click_on 'Checkout'

    fill_in_order_information

    click_on 'Save'

    expect(page).to have_content t('orders.create.success')
    expect(page).to have_content '2x Growler'
    expect(page).to have_content total
  end

  def total
    '$5.00'
  end

  def fill_in_order_information
    fill_in_billing_information
    fill_in_shipping_information
    fill_in 'Note', with: FFaker::Lorem.paragraph
  end

  def fill_in_billing_information
    within('.billing-information') do
      fill_in 'Name', with: FFaker::Name.name
      fill_in 'Address', with: FFaker::Address.street_address
      fill_in 'City', with: FFaker::Address.city
      fill_in 'State/Province', with: FFaker::AddressUS.state
      fill_in 'Postal/Zip Code', with: FFaker::AddressUS.zip_code
      select 'Canada', from: 'Country'
    end
  end

  def fill_in_shipping_information
    within('.shipping-information') do
      fill_in 'Name', with: FFaker::Name.name
      fill_in 'Address', with: FFaker::Address.street_address
      fill_in 'City', with: FFaker::Address.city
      fill_in 'State/Province', with: FFaker::AddressUS.state
      fill_in 'Postal/Zip Code', with: FFaker::AddressUS.zip_code
      select 'Canada', from: 'Country'
    end
  end
end
