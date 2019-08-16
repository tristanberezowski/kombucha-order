require 'rails_helper'

RSpec.describe ProductExemption, type: :model do
  it { should belong_to :product }
end
