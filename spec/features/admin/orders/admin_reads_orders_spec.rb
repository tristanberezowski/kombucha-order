require "rails_helper"

feature "Admin reads orders" do

  let(:admin) { create(:admin) }

  before do
    (1..3).each do |count|
      create(:order)
    end
  end

  scenario "from admin orders index" do
    visit admin_orders_path

    first(".show-order").click

    expect(page).to have_content "Shipping Information"
  end
end