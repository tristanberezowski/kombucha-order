class CreateInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :invites do |t|
      t.string :email
      t.belongs_to :admin, foreign_key: true
      t.string :token

      t.timestamps
    end
  end
end
