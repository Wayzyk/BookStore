require 'rails_helper'

RSpec.describe BookAttachment, type: :model do
  it { should belong_to(:book) }
end
