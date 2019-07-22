require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_one :cart }
  it { should have_many :user_exemptions }
  it { should have_many :delivery_exemptions }

  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
end
