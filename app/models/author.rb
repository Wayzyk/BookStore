class Author < ApplicationRecord
  has_many :book_authors
  has_many :books, through: :book_authors
  validates_presence_of :first_name, :last_name, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
