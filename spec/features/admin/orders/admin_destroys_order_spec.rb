require "rails_helper"

feature 'Admin destroys an order' do 
    let!(:order) { create(:order) }
    let!(:product) { create(:product) }

    before do
        sign_in_admin
        create(:order_product, order: order, product: product)
        create(:liquid_price, container: product.container, liquid: product.liquid)
    end
    
    scenario 'From show order page' do
        visit admin_order_path(order)
        click_on "Delete this order permanently"
        expect(page).to have_content t('orders.destroy.success')
    end
end