require 'rails_helper'

RSpec.describe OrderSelection, type: :model do
  it { should belong_to :order }
  it { should belong_to :selectable }

  it { should allow_value(1).for(:quantity) }
  it { should_not allow_value(-1).for(:quantity) }
  it { should_not allow_value(0).for(:quantity) }
  it { should_not allow_value("$").for(:quantity) }
end
