require "rails_helper"

feature 'Admin destroys product' do 
    let(:product) { create(:product) }

    before do
        create(:liquid_price, container: product.container, liquid: product.liquid)
        sign_in_admin
    end
    
    scenario 'From show admin product page' do
        visit admin_product_path(product)
        click_on "Delete"
        expect(page).to have_content t('products.destroy.success')
    end
end