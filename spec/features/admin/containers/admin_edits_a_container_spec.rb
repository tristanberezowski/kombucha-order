require 'rails_helper'

feature 'Admin updates products' do
  let(:admin) { create(:admin) }

  context 'when signed in as an admin' do
    let!(:container) { create(:container) }

    before do
      sign_in_admin
    end

    scenario 'from the admin container page' do
      visit admin_containers_path

      click_on container.name

      fill_in 'Environmental Fee', with: 3.00

      click_on 'Update Container'

      expect(page).to have_content t('containers.update.success')
    end
  end
end
