require 'rails_helper'

RSpec.describe Cart, type: :model do
  it { should belong_to :user }
  it { should have_many :cart_products }
  it { should have_many :products }

  describe '#subtotal' do
    let(:cart) { create(:cart) }
    let(:products) { create_list(:product, 2) }
    let!(:liquid_price) { create(:liquid_price, price: Money.new(250), container: products.first.container, liquid: products.first.liquid)}
    let!(:liquid_price2) { create(:liquid_price, price: Money.new(250), container: products.last.container, liquid: products.last.liquid)}
    let(:result) { cart.subtotal }
    let(:total) { Money.new(500) + cart.delivery_fee + cart.environmental_fee }


    context 'when the cart has products' do
      before do
        cart.products << products
        cart.save!
      end

      it 'should return the summed total of products prices' do
        expect(result).to eq total
      end
    end
  end
end
