class CreateInviteExemptions < ActiveRecord::Migration[5.2]
  def change
    create_table :invite_exemptions do |t|
      t.belongs_to :invite, foreign_key: true
      t.belongs_to :exemptable, polymorphic: true

      t.timestamps
    end
  end
end
