class Post < ActiveRecord::Base
  belongs_to :user
  has_many :requests
  validates_presence_of :title, :description
  mount_uploader :main_photo, MainPhotoUploader
end