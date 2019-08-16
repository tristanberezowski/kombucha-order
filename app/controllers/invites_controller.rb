class InvitesController < ApplicationController
  def show
    @invite = Invite.find_by(token: token)
  end

  private

  def token
    params.fetch(:id, '')
  end
end
