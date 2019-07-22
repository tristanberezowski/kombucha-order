class AddStatusToInvites < ActiveRecord::Migration[5.2]
  def change
    add_column :invites, :status, :string
  end
end
