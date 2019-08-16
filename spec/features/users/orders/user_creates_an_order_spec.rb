require 'rails_helper'

feature 'User creates an order' do
  let(:keg) { create(:keg) }
  let(:growler) { create(:growler) }
  let!(:selection) { create(:liquid_selection, container: growler) }
  let!(:second_selection) { create(:liquid_selection, container: keg) }
  let!(:product) { create(:product, price: Money.new(500), selectable: selection) }
  let!(:second_product) { 
    create(:product, price: Money.new(500), selectable: second_selection) 
  }
  let(:city) { Order::VALID_CITIES.sample }
  let(:email_result) { Mailgun::Client.deliveries.first[:from] }
  before do
    sign_in_user
  end

  scenario 'by saving it for later' do
    visit products_path

    within "#product-#{product.id}" do
      fill_in 'Quantity', with: '2'
      click_on 'Add to Cart'
    end

    within "#product-#{second_product.id}" do
      fill_in 'Quantity', with: '3'
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
    expect(page).to have_content delivery_date_for(Order.last)
    expect(page).to have_content total
  end

  def total
    '$10.00'
  end

  def delivery_date_for(order)
    order.make_delivery_date_next_possible(city).strftime("Scheduled for delivery on %m/%d/%Y")
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
      fill_in 'City', with: city
      fill_in 'State/Province', with: FFaker::AddressUS.state
      fill_in 'Postal/Zip Code', with: FFaker::AddressUS.zip_code
      select 'Canada', from: 'Country'
    end
  end
end
