require "rails_helper"

feature 'Admin queries quickbooks' do
  
  before do
    sign_in_admin
  end

  scenario 'from the dashboard' do
    visit admin_dashboard_path
    click_on 'Query Quickbooks'
  end

end