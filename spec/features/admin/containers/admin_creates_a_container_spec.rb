require "rails_helper"

feature "Admin creates a container" do
  let(:admin) { create(:admin) }

  before do
    sign_in_admin
  end

  scenario 'from the admin containers page' do
    visit admin_containers_path

    click_on 'New Container'

    fill_in 'Name', with: '2L Growler'
    fill_in 'Volume', with: 2000
    fill_in 'Environmental Fee', with: 0.11

    click_on 'Create Container'

    expect(page).to have_content t('containers.create.success')
  end

end