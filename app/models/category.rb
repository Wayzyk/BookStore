class Category < ApplicationRecord
  has_many :book_categories
  has_many :books, through: :book_categories

  scope :with_counted_books, -> { joins(:books).select('categories.*, count(books.id) as books_count').group('categories.id') }
end
