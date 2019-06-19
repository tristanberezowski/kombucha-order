require 'rails_helper'

RSpec.describe UserExemption, type: :model do
  it { should belong_to :user }
end
