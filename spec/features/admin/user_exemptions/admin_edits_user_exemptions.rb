require "rails_helper"

feature "Admin edits user exemption" do
  let!(:user) { create(:user) }
  let(:delivery_exemption) { create(:delivery_exemption) }


  before do
    sign_in_admin
    create(:user_exemption, user: user, exemptable: delivery_exemption)
  end

  scenario 'from the admin user index page, editing delivery exemption' do
    visit admin_users_path
    click_on user.name
    click_on "Edit"

    fill_in "Delivery Fee", with: 35
    click_on "Update Delivery exemption"
    expect(page).to have_content t("users.update.success")
  end

end