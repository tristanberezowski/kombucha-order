require 'rails_helper'

RSpec.describe RefreshToken, type: :model do
  it { should validate_presence_of :name }
end
