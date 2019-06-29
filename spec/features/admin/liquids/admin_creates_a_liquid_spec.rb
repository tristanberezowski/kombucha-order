require 'rails_helper'

feature "Admin creates a liquid" do
  let(:admin) { create(:admin) }

  before do
    sign_in_admin
  end

  scenario 'from the admin liquids page' do
    
    visit admin_liquids_path

    click_on 'Create new liquid type'

    fill_in 'Name', with: 'Kombucha'

    click_on 'Create Liquid'

    expect(page).to have_content t('liquids.create.success')
  end

end

