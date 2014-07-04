class Post < ActiveRecord::Base
  mount_uploader :main_photo, MainPhotoUploader
end