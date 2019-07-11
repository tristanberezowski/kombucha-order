require 'rails_helper'

RSpec.describe Liquid, type: :model do
  it { should validate_presence_of :name }
  it { should have_many :flavours }

  describe "#containers_count" do
    let(:liquid) { create(:liquid) }
    let(:flavour) { create(:flavour, liquid: liquid)}
    let(:container1) { create(:container) }
    let(:container2) { create(:container) }
    let(:selection) { create(:liquid_selection, container: container1, flavour: flavour) }
    let(:result) { liquid.containers_count }
    before do
      create(:product, selectable: selection)
    end

    it "should give return number of containers being sold of the liquid" do
      expect(result).to eq(1)
    end
  end
end
