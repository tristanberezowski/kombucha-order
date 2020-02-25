require 'rails_helper'

RSpec.describe LiquidPrice, type: :model do
  it { should belong_to :container }
  it { should belong_to :liquid }
end
