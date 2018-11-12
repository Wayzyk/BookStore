require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:reviews) }

  it { should have_one(:billing_address) }

  it { should have_one(:shipping_address) }

end
