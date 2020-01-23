class CreateRefreshTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :refresh_tokens do |t|
      t.string :name
      t.datetime :date_created

      t.timestamps
    end
  end
end
