require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :price_cents }

  describe '#available_containers' do
    let(:product) { create(:product) }
    let(:result) { product.available_containers }

    context 'when no containers are available' do
      it 'should return an empty array' do
        expect(result.empty?).to eq true
      end
    end

    context 'when containers are available' do
      let(:container) { create(:container) }

      before do
        create(:product_container, container: container)
      end

      it 'should return the containers' do
        expect(result.count).to eq 1
      end
    end
  end
end
