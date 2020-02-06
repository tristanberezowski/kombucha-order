require 'rails_helper'

feature 'Admin invites a user' do
  before do
    sign_in_admin
  end

  scenario 'via email' do
    visit admin_users_path

    click_on 'Send Invite'

    fill_in 'Email', with: FFaker::Internet.email

    click_on 'Create Invite'

    expect(page).to have_content t('invites.create.success')
  end

  scenario "with a delivery exemption", js: true do
    visit admin_users_path
    click_on 'Send Invite'

    fill_in 'Email', with: FFaker::Internet.email
    click_on 'Add Delivery exemption'
    fill_in 'Add unique delivery cost (optional)', with: "30.00"

    click_on 'Create Invite'

    expect(page).to have_content t('invites.create.success')
  end
end
