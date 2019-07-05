require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should belong_to :user }
  it { should have_many :order_products }
  it { should have_many :products }

  describe "#make_delivery_date_next_possible" do

    before do
      Timecop.safe_mode = false
      Timecop.freeze(Time.zone.parse('2019-07-05 16:00:00'))
    end

    after do
      Timecop.return
    end

    context "the order is placed from Vancouver" do
      let(:order) { create(:order, shipping_city: "Vancouver") }
      let(:expected_date) { Time.current.noon + 5.days }
      let(:result) { order.make_delivery_date_next_possible("Vancouver") }
      it "should return the next Wednesday" do
        expect(result).to eq( expected_date )
      end
    end

    context "the order is placed from Langley or Surrey" do
      let(:order) { create(:order, shipping_city: "Langley") }
      let(:expected_date) { Time.current.noon + 7.days }
      let(:result) { order.make_delivery_date_next_possible("Langley")}
      it "should return the next Wednesday" do
        expect(result).to eq( expected_date )
      end
    end
    context "the order is placed from Coquitlam, Port Moody, or Maple Ridge" do
      let(:order) { create(:order, shipping_city: "Coquitlam") }
      let(:expected_date) { Time.current.noon + 6.days }
      let(:result) { order.make_delivery_date_next_possible("Coquitlam")}
      it "should return the next Wednesday" do
        expect(result).to eq( expected_date )
      end
    end
  end

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
