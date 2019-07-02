require 'rails_helper'

RSpec.describe CartProduct, type: :model do
  it { should belong_to :cart }
  it { should belong_to :product }
  it { should allow_value(1).for(:quantity) }
  it { should_not allow_value(-1).for(:quantity) }
  it { should_not allow_value(0).for(:quantity) }
  it { should_not allow_value("$").for(:quantity) }
end
