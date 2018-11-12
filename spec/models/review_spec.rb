require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:book) }

  it do
    should validate_presence_of(:rating)
  end

  it do
    should validate_presence_of(:title)
  end

  it do
    should validate_presence_of(:comment)
  end

  it do
    should validate_numericality_of(:rating).
      is_greater_than_or_equal_to(1).
      is_less_than_or_equal_to(5).
      only_integer
  end
end
