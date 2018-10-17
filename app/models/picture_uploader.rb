class PictureUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process :convert => 'png'
  process :tags => ['book_picture']

  version :standart do
    process :resize_to_fill => [100,150,:north]
  end

  version :thumbnail do
    resize_to_fit(50,50)
  end

  if Rails.env.development?
    storage :cloudinary
  else
    storage :file
  end
end
