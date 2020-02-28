require 'rails_helper'

feature 'User creates an order' do
  let(:keg) { create(:keg) }
  let(:growler) { create(:growler) }
  let!(:selection) { create(:liquid_selection, container: growler) }
  let!(:second_selection) { create(:liquid_selection, container: keg) }
  let!(:product) { create(:product, selectable: selection) }
  let!(:second_product) { 
    create(:product, selectable: second_selection) 
  }
  let(:email_result) { Mailgun::Client.deliveries.first[:from] }
  before do
    create(:liquid_price, container: product.container, liquid: product.liquid, price: Money.new(300))
    create(:liquid_price, container: second_product.container, liquid: second_product.liquid, price: Money.new(500))
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

    fill_in 'Note', with: FFaker::Lorem.paragraph

    click_on 'Save'

    expect(page).to have_content t('orders.create.success')
    expect(page).to have_content '2x Growler'
    expect(page).to have_content delivery_date_for(Order.last)
    expect(page).to have_content total
  end

  def total
    Money.new( ((2 * 300 + 3 * 500) + 700 ) * 1.05 )
  end

  def delivery_date_for(order)
    order.make_delivery_date_next_possible('Vancouver').strftime("Scheduled for delivery on %m/%d/%Y")
  end
end
