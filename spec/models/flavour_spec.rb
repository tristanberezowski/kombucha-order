require 'rails_helper'

RSpec.describe Flavour, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should belong_to :liquid }

  describe "#total_volume_needed" do
    let(:flavour) { create(:flavour) }
    let(:orders) { create_list(:order, rand(1..5) ) }
    let(:container) { create(:container, volume: 500) }
    let(:products_count) { orders.map(&:products).flatten.count }
    let(:expected_volume) { container.volume * products_count }
    let(:selection) { create(:liquid_selection, container: container, flavour: flavour) }
    let(:product) { create(:product, selectable: selection) }

    let(:result) do
      flavour.total_volume_needed(orders)
    end

    before do
      orders.each do |order|
        create_list(:order_product, 2, order: order, product: product )
      end
    end

    it "should return total volume needed for active orders" do
      expect(result).to eq(expected_volume)
    end
  end
end
