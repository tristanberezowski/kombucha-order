class AddUserToInvites < ActiveRecord::Migration[5.2]
  def change
    add_reference :invites, :user, foreign_key: true
  end
end
