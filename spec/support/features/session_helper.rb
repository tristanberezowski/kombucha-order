module Features
  module SessionHelper
    def sign_in_admin(admin = FactoryBot.create(:admin))
      visit new_admin_session_path

      fill_in 'Email', with: admin.email
      fill_in 'Password', with: admin.password

      click_on 'Log in'
    end

    def sign_in_user(user = FactoryBot.create(:user))
      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_on 'Log in'
    end

  end
end
