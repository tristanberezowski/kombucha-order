require 'rails_helper'

RSpec.describe Container, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :volume }

end
