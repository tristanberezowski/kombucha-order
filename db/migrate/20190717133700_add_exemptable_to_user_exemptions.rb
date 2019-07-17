class AddExemptableToUserExemptions < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_exemptions, :exemptable, polymorphic: true
  end
end
