class Book < ApplicationRecord
  belongs_to :category
  has_many :reviews

  mount_uploader :picture, PictureUploader
end
