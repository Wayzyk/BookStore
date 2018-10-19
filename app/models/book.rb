class Book < ApplicationRecord
  has_many :book_authors
  has_many :authors, through: :book_authors
  has_many :reviews
  belongs_to :category 
  mount_uploader :picture, PictureUploader
end
