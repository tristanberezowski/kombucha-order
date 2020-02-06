require 'rails_helper'

feature "Admin edits a user" do
  let!(:user) { create(:user) }

  before do
    sign_in_admin
  end

  scenario 'from the users page' do
    visit admin_users_path
    click_on user.name
    click_on "Edit User"

    fill_in 'Shipping Address', with: "123 Example St"
    click_on 'Update User'

    expect(page).to have_content t('users.update.success')

  end
end