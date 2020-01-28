class CreateRealmIds < ActiveRecord::Migration[5.2]
  def change
    create_table :realm_ids do |t|
      t.string :name

      t.timestamps
    end
  end
end
