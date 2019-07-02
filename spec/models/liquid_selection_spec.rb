require 'rails_helper'

RSpec.describe LiquidSelection, type: :model do
  it { should belong_to :flavour }
  it { should belong_to :container }
  it { should have_one :liquid }

  describe '#price' do
    let(:container) { create(:container, price: Money.new(500), volume: 100) }
    let(:flavour) { create(:flavour, price: Money.new(1)) }
    let(:liquid_selection) {
      create(:liquid_selection, container: container, flavour: flavour) 
    }
    let(:price) { liquid_selection.price }

    it 'should return the price based on the flavour and container' do
      expect(price).to eq Money.new(600)
    end
  end
end
