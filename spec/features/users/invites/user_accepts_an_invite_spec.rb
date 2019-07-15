require 'rails_helper'

feature 'User accepts an invite' do
  let(:invite) { create(:invite) }

  scenario 'with a correct token' do
    visit invite_path(invite.token)

    fill_in_user

    click_on 'Accept Invite'

    expect(page).to have_content t('devise.registrations.signed_up')
  end

  scenario 'with an incorrect token' do
    visit invite_path('bad_token')

    fill_in_user

    click_on 'Accept Invite'

    expect(page).to have_content t('invites.token.invalid')
  end

  def fill_in_user
    fill_in 'Email', with: FFaker::Internet.email
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
  end
end
