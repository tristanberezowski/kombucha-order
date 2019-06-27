require 'rails_helper'

feature 'User creates an order' do
  before do
    create(:product, price: Money.new(500))
    sign_in_user
  end

  scenario 'by saving it for later' do
    visit products_path

    click_on 'Add to Cart'

    within '.navigation' do
      click_on 'Cart'
    end

    click_on 'Checkout'
  
    fill_in_order_information

    click_on 'Save'

    expect(page).to have_content t('orders.create.success')
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
