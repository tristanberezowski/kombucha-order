require 'rails_helper'

RSpec.describe Invite, type: :model do
  it { should belong_to :admin }
  it { should validate_presence_of :email }
end
