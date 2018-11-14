require 'rails_helper'

RSpec.describe CreditCard, type: :model do
  it { should belong_to(:order) }

  it do
    should validate_presence_of(:credit_card_number)
  end

  it do
    should validate_presence_of(:month)
  end

  it do
    should validate_presence_of(:year)
  end

  it do
    should validate_presence_of(:cvv)
  end

  it do
    should validate_presence_of(:card_name)
  end

  it { should validate_numericality_of(:cvv).only_integer }
end
