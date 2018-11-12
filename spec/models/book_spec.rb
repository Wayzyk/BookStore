require 'rails_helper'

RSpec.describe Book, type: :model do
  it { should have_many(:book_authors) }
  it { should have_many(:authors) }
  it { should have_many(:reviews) }
  it { should have_many(:book_categories) }
  it { should have_many(:categories) }
  it { should have_many(:order_items) }
  it { should have_many(:orders) }
  it { should have_many(:book_attachments) }

  subject { described_class.new(name: 'Some book', price: '10.21', description: 'Some text',
                                year_of_publish: 2013, materials: 'Iron', height: '2.4',
                                width: '4.5', length: '6.6')}

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without price" do
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without description" do
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without publish year" do
      subject.year_of_publish = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without materials" do
      subject.materials = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without width" do
      subject.width = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without length" do
      subject.length = nil
      expect(subject).to_not be_valid
    end

    it do
      should validate_numericality_of(:price).
        is_greater_than_or_equal_to(0.01)
    end

    it { should validate_numericality_of(:height) }

    it { should validate_numericality_of(:width) }

    it { should validate_numericality_of(:length) }

    it do
      should validate_numericality_of(:year_of_publish).
        is_greater_than_or_equal_to(1900)
    end

    it do
      should validate_numericality_of(:year_of_publish).
        is_less_than_or_equal_to(Time.now.year)
    end

    it do
      should validate_length_of(:name).
        is_at_most(120)
    end

    it do
      should validate_length_of(:materials).
        is_at_most(80)
    end
  end
end
