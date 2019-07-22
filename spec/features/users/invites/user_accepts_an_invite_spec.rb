require 'rails_helper'

feature 'User accepts an invite' do
  let(:invite) { create(:delivered_invite) }
  let(:delivery_exemption) { create(:delivery_exemption) }
  let(:email) { FFaker::Internet.email}
  
  before do
    create(:invite_exemption, invite: invite, exemptable: delivery_exemption)
  end

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

  scenario 'with delivery exemption' do
    visit invite_path(invite.token)

    fill_in_user
    click_on 'Accept Invite'
    current_user = User.find_by(email: email)
    expect(current_user.delivery_fee).to eq(delivery_exemption.fee)

  end

  def fill_in_user
    fill_in 'Email', with: email
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
  end
end
