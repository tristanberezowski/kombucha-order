require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should belong_to :selectable }

  it { should validate_presence_of :name }

  it { should accept_nested_attributes_for :selectable }

  it { should validate_presence_of :selectable_type }
  it { should allow_value(Product::VALID_TYPES.sample).for(:selectable_type) }
  it { should_not allow_value('Admin').for(:selectable_type) }

  describe "#price_for" do
    let(:user) {create(:user)}
    let(:product) { create(:product, price: Money.new(500)) }
    let!(:product_exemption) { 
      create(:product_exemption, product: product, fee: Money.new(250))
    }
    let!(:user_exemption) {
      create(:user_exemption, user: user, exemptable: product_exemption)
    }
    let(:result) { product.price_for(user) }
    it "should return the price exemption fee" do
      expect(result).to eq(product_exemption.fee)
    end

  end

  describe "#container" do
    let(:container) { create(:container) }
    let(:selection) { create(:liquid_selection, container: container) }
    let(:product) { create(:product, selectable: selection) }
    let(:result) { product.container }

    it "should return the container" do
      expect(result).to eq(container)
    end
    
  end
end
