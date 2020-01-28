require 'rails_helper'

RSpec.describe AccessToken, type: :model do
  it { should validate_presence_of :name }
end
