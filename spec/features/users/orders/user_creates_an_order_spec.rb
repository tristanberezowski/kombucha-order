require 'rails_helper'

feature 'User creates an order' do
  before do
    create(:product)
    sign_in_user
  end

  scenario 'by saving it for later' do
    visit products_path

    click_on 'Add to Cart'

    within '.navigation' do
      click_on 'Cart'
    end

    click_on 'Checkout'

    place_order

    click_on 'Save'

    expect(page).to have_content t('orders.create.success')
  end

  scenario 'by placing it right away' do
    visit products_path

    click_on 'Add to Cart'

    click_on 'Cart'

    click_on 'Checkout'

    place_order

    click_on 'Proceed to Payment'

    expect(page).to have_content t('orders.create.success')
  end


  def place_order
    fill_in_billing_information
    fill_in_shipping_information
  end

  def fill_in_billing_information
    fill_in 'Name', with: FFaker::Name.name
    fill_in 'Address', with: FFaker::Address.street_address
    fill_in 'City', with: FFaker::Address.city
    fill_in 'State/Province', with: FFaker::AddressUS.state
    fill_in 'Postal/Zip Code', with: FFaker::AddressUS.zip_code
    fill_in 'Country', with: FFaker::Address.country
  end

  def fill_in_shipping_information
    fill_in 'Name', with: FFaker::Name.name
    fill_in 'Address', with: FFaker::Address.street_address
    fill_in 'City', with: FFaker::Address.city
    fill_in 'State/Province', with: FFaker::AddressUS.state
    fill_in 'Postal/Zip Code', with: FFaker::AddressUS.zip_code
    fill_in 'Country', with: FFaker::Address.country
    fill_in 'Note', with: FFaker::Lorem.paragraph
  end
end
