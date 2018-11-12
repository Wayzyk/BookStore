class Book < ApplicationRecord
  has_many :book_authors
  has_many :authors, through: :book_authors
  has_many :reviews
  has_many :book_categories
  has_many :categories, through: :book_categories
  has_many :order_items
  has_many :orders, through: :order_items
  has_many :book_attachments

  validates_presence_of :name, :price, :description, :year_of_publish, :materials, :height, :width, :length
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :height, :width, :length, numericality: { only_float: true }
  validates :year_of_publish, numericality: {
                             greater_than_or_equal_to: 1900,
                             less_than_or_equal_to: Time.now.year
                           }
   validates :name, uniqueness: true
   validates_length_of :name, maximum: 120
   validates_length_of :materials, maximum: 80
   validates_length_of :description, in: 5..2000
end
