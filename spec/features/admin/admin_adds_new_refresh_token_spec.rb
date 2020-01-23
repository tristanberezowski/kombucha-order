require "rails_helper"

feature 'Admin adds new refresh token' do
    
    before do
      sign_in_admin
    end

  scenario 'from the dashboard' do
    visit admin_dashboard_path
    click_on 'Refresh Quickbooks Token'

    expect(page).to have_content "Site to Refresh Token"
  end
end