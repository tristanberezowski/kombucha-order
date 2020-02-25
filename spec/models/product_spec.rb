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
    let(:user2) {create(:user)}
    let(:container) {create(:container)}
    let(:liquid) {create(:liquid)}
    let!(:liquid_price) { create(:liquid_price, container: container, liquid: liquid) }
    let!(:liquid_price_for_user) { create(:liquid_price, container: container, liquid: liquid, user: user)}
    let(:flavour) { create(:flavour, liquid: liquid)}
    let(:liquid_selection) { create(:liquid_selection, flavour: flavour, container: container)}
    let(:product) { create(:product, selectable: liquid_selection) }
    let(:result_not_default) { product.price_for(user) }
    let(:result_default) { product.price_for(user2) }
    it "should return the user specific price" do
      expect(result_not_default).to eq(liquid_price_for_user.price)
      expect(result_default).to eq(liquid_price.price)
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
