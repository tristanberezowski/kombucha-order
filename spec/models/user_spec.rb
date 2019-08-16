require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_one :cart }
  it { should have_many :user_exemptions }
  it { should have_many :delivery_exemptions }
  it { should have_many :cart_products }

  it { should validate_presence_of :email }
  it { should validate_presence_of :password }

  describe "#delivery_fee" do
    context "a delivery exemption exists" do
      let(:user) { create(:user) }
      let(:delivery_exemption) { create(:delivery_exemption) }
      let!(:user_exemption) { create(:user_exemption, user: user, exemptable: delivery_exemption) }
      let(:order) { create(:order, user: user) }
      let(:result) { user.delivery_fee }
      it "should return the fee from the exemption" do
        expect(result).to eq(delivery_exemption.fee)
      end


    end

    context "a delivery exemption doesn't exist" do
      let(:user) { create(:user) }
      let(:result) { user.delivery_fee }
      it "should return the default delivery fee" do
        expect(result).to eq(Money.new(700))
      end
    end

  end
end
