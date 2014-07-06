class Post < ActiveRecord::Base
  belongs_to :user
  has_many :requests
  has_many :commitments
  validates_presence_of :title, :description
  mount_uploader :main_photo, MainPhotoUploader

  def givable?
    commitments.empty? || commitments.last.status == :failure
  end

end