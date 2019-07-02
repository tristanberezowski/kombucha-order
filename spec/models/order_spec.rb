require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to :user }
  it { should have_many :order_products }
  it { should have_many :products }

  describe "#total" do
    context "the order has no products" do

      let(:order) { create(:order) }

      it "returns $0" do
        expect(order.total).to eq (Money.new(0))
      end
    end

    context "the order has products" do
      let(:order) { create(:order) }
      let(:product) { create(:product) }

      before do
        create(:order_product, order: order, product: product)
      end

      it "sums the products in the order" do
        expect(order.total).to eq (product.price)
      end
    end
  end
end
