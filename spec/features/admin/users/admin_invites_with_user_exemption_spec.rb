require "rails_helper"

feature "Admin invites with user exemption" do
  before do
    sign_in_admin
  end

  scenario "Using the invite form" do
    visit admin_users_path
    click_on 'Send Invite'
    fill_in 'Email', with: FFaker::Internet.Email
    
    fill_in 'Delivery Fee', with: Money.new(3000)
    fill_in 'Order Minimum', with: Money.new(4000)

    click_on 'Create Invite'

    expect(page).to have_content t('invites.exemptions.create.success')

  end

end