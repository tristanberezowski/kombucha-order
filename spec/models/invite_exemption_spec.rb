require 'rails_helper'

RSpec.describe InviteExemption, type: :model do
  it { should belong_to :invite }
  it { should belong_to :exemptable }
end
