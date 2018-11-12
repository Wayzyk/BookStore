require 'rails_helper'

RSpec.describe Delivery, type: :model do
  it do
    should validate_presence_of(:method)
  end

  it do
    should validate_presence_of(:delivery_price)
  end

  it do
    should validate_presence_of(:min_days)
  end

  it do
    should validate_presence_of(:max_days)
  end

  it do
    should validate_numericality_of(:delivery_price).
      is_greater_than_or_equal_to(0.01)
  end
end
