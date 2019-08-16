require 'rails_helper'

RSpec.describe Invite, type: :model do
  it { should belong_to :admin }
  it { should belong_to(:user).optional }

  it { should have_many :invite_exemptions }
  it { should have_many :delivery_exemptions }

  it { should validate_presence_of :email }

  it { should accept_nested_attributes_for :delivery_exemptions }
end
