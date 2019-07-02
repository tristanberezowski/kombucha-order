require 'rails_helper'

RSpec.describe ProductContainer, type: :model do
  it { should belong_to :product }
  it { should belong_to :container }
end
