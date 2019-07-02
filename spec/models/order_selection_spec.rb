require 'rails_helper'

RSpec.describe OrderSelection, type: :model do
  it { should belong_to :order }
  it { should belong_to :selectable }
end
