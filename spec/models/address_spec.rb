require 'rails_helper'

RSpec.describe Address, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:first_name)}
  it { should validate_presence_of(:last_name)}
  it { should validate_presence_of(:address)}
  it { should validate_presence_of(:city)}
  it { should validate_presence_of(:zip)}
  it { should validate_presence_of(:country)}
  it { should validate_presence_of(:phone)}

  it do
    should validate_length_of(:first_name).
      is_at_most(49)
  end

  it do
    should validate_length_of(:last_name).
      is_at_most(49)
  end

  it do
    should validate_length_of(:address).
      is_at_most(49)
  end

  it do
    should validate_length_of(:city).
      is_at_most(49)
  end

  it do
    should validate_length_of(:country).
      is_at_most(49)
  end


end
