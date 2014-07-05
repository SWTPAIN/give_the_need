class Post < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title, :description
  mount_uploader :main_photo, MainPhotoUploader
end