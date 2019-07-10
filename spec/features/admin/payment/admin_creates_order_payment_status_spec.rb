require "rails_helper"

feature "Admin creates order payment status" do
  let (:admin) { create(:admin) }
  let (:order) { create(:order) }

  before do
    sign_in_admin
  end

  scenario "from the admin order show page" do

    visit admin_order_path(order)

    fill_in_payment
    click_on 'Create Payment'
    expect(page).to have_content t('orders.payment.create.success')
    expect(page).to have_content "Order is paid"

  end
  
  scenario "from the admin new payment page" do

    visit new_admin_order_payment_path(order)
    fill_in_payment
    click_on 'Create Payment'
    expect(page).to have_content t('orders.payment.create.success')
    expect(page).to have_content "Order is paid"
    
  end

  def fill_in_payment
    fill_in 'Payee', with: FFaker::Name.name
    select "Credit Card", from: "Payment method"
    fill_in "Payment date", with: "01/01/2019"
    
  end
end