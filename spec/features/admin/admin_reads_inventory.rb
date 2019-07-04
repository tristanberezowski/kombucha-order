require "rails_helper"

feature 'Admin views production/order requirements' do
  let(:admin) { create(:admin) }

  context 'after orders have been placed' do
    let!(:orders) { create_list(:order, 3) }

    before do
      orders.each do |order|
        create_list(:order_product, rand(1..5), order: order)
      end

      sign_in_admin
    end

    scenario 'from the admin orders page' do

      visit admin_orders_path

      expect(Order.all.length).to eq(3)
      
    end
  end
  
end