class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :shipping_address, :string
    add_column :users, :shipping_city, :string
    add_column :users, :shipping_postal, :string
    add_column :users, :shipping_province, :string
    add_column :users, :company_name, :string
  end
end
