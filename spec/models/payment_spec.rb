require 'rails_helper'

RSpec.describe Payment, type: :model do
  it { should belong_to :order }
  it { should validate_presence_of :payee }
  it { should validate_presence_of :payment_method }
  it { should validate_presence_of :payment_date }

end
