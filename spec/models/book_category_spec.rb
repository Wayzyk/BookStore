require 'rails_helper'

RSpec.describe BookCategory, type: :model do
  it { should belong_to(:category) }
  it { should belong_to(:book) }
end
