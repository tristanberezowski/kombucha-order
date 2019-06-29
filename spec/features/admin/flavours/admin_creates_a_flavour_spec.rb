require 'rails_helper'

feature "Admin creates a flavour" do
  let(:admin) { create(:admin) }

  before do
    sign_in_admin
    create(:liquid, name: "Kombucha")
  end

  scenario 'from the admin flavours page' do

    visit admin_flavours_path

    click_on 'New Flavour'
    fill_in 'Name', with: 'Lady Grey'
    fill_in 'Description', with: 'Sweet earl grey dessert'
    select 'Kombucha', from: "Select Liquid"

    click_on 'Create Flavour'

    expect(page).to have_content t("flavours.create.success")
  end



end

