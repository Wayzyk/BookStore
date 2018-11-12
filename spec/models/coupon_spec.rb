require 'rails_helper'

RSpec.describe Coupon, type: :model do
  it do
    should validate_numericality_of(:amount).
      on(:create)
  end

  it do
    should validate_uniqueness_of(:code).
      on(:create)
  end

  it do
    should validate_presence_of(:amount)
  end

  it do
    should validate_presence_of(:code)
  end

  it do
    should validate_numericality_of(:amount)
  end

  it do
    should validate_length_of(:code)
  end

  it { should have_many(:orders) }
end
