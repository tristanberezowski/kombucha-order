require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to :user }
  it { should have_many :order_selections }
  it { should have_many :liquid_selections }

  describe "#total" do
    context "the order has no products" do

      let(:order) { create(:order) }

      it "returns $0" do
        expect(order.total).to eq (Money.new(0))
      end
    end

    context "the order has products" do
      let(:order) { create(:order) }
      let(:selection) { create(:liquid_selection) }

      before do
        create(:order_selection, order: order, selectable: selection)
      end

      it "sums the products in the order" do
        expect(order.total).to eq (selection.price)
      end
    end
  end
end
