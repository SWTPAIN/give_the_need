class Post < ActiveRecord::Base
  belongs_to :user
  mount_uploader :main_photo, MainPhotoUploader
end