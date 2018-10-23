class BookAttachment < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :book
end
