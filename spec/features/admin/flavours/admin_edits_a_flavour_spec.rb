require 'rails_helper'

feature 'admin edits a flavour' do
  let!(:liquid) { create(:liquid) }
  let!(:flavour) { create(:flavour, name: "Apple", liquid: liquid) }
  before do
    sign_in_admin
  end

  scenario 'from the admin flavours page' do
    visit admin_flavours_path

    click_on flavour.name
    fill_in 'Description', with: "Tastes great"
    click_on 'Save'
    expect(page).to have_content t("flavours.update.success")
    expect(page).to have_content "Tastes great"
    
  end


end