require 'rails_helper'

feature "Admin creates a flavour" do
  let :admin create :admin

  scenario 'from the admin flavours page' do
    before do
      sign_in_admin
    end

    visit admin_flavours_path

    click_on 'New Flavour'

    fill_in 'Name', with: 'Lady Grey'
    fill_in 'Description', with: 'Sweet earl grey dessert'
  end



end

