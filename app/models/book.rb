class Book < ApplicationRecord
  has_many :book_authors
  has_many :authors, through: :book_authors
  has_many :reviews
  has_many :book_categories
  has_many :categories, through: :book_categories
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :book_attachments
end
