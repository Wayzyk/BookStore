require 'rails_helper'

RSpec.describe Author, type: :model do
  subject { described_class.new(first_name: 'John', last_name: 'Doe') }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a first name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a last_name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end
  end

  it { should have_many(:book_authors) }
  it { should have_many(:books) }
end
