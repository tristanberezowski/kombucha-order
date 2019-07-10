require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should belong_to :selectable }

  it { should validate_presence_of :name }

  it { should accept_nested_attributes_for :selectable }

  it { should validate_presence_of :selectable_type }
  it { should allow_value(Product::VALID_TYPES.sample).for(:selectable_type) }
  it { should_not allow_value('Admin').for(:selectable_type) }
end
