class Book < ApplicationRecord
  has_many :book_authors
  has_many :authors, through: :book_authors
  has_many :reviews
  has_many :book_categories
  belongs_to :category
  mount_uploader :picture, PictureUploader
end
