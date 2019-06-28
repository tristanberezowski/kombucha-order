require 'rails_helper'

RSpec.describe Cart, type: :model do
  it { should belong_to :user }
  it { should have_many :cart_products }
  it { should have_many :products }

end
