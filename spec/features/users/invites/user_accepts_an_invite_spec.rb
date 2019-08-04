require 'rails_helper'

feature 'User accepts an invite' do
  let(:invite) { create(:delivered_invite) }
  let(:delivery_exemption) { create(:delivery_exemption, fee: Money.new(500)) }
  let(:email) { FFaker::Internet.email}

  let(:product) { create(:product, price: Money.new(5000)) }
  let(:product_exemption) { create(:product_exemption, product: product, fee: Money.new(300)) }
  
  before do
    create(:invite_exemption, invite: invite, exemptable: delivery_exemption)
    create(:invite_exemption, invite: invite, exemptable: product_exemption)
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
    expect(page).to have_content t('devise.registrations.signed_up')
    
    visit new_order_path
    expect(page).to have_content("$5.00")

  end

  scenario 'with price exemption' do
    visit invite_path(invite.token)
    fill_in_user
    click_on 'Accept Invite'
    expect(page).to have_content t('devise.registrations.signed_up')

    visit products_path
    expect(page).to have_content("$3.00")

  end

  def fill_in_user
    fill_in 'Email', with: email
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
  end
end
