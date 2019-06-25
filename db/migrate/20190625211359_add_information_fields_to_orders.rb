class AddInformationFieldsToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :billing_name, :string
    add_column :orders, :billing_address, :string
    add_column :orders, :billing_city, :string
    add_column :orders, :billing_province, :string
    add_column :orders, :billing_postal, :string
    add_column :orders, :billing_country, :string
    add_column :orders, :shipping_name, :string
    add_column :orders, :shipping_address, :string
    add_column :orders, :shipping_city, :string
    add_column :orders, :shipping_province, :string
    add_column :orders, :shipping_postal, :string
    add_column :orders, :shipping_country, :string
    add_column :orders, :note, :string
  end
end
