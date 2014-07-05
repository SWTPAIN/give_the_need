class MainPhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  process :resize_to_fit => [400, 400]

  version :thumb do
    process :resize_to_fit => [200,200]
  end

end