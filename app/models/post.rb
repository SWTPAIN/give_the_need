class Post < ActiveRecord::Base
  belongs_to :user
  has_many :requests
  has_many :commitments
  has_many :post_locations
  has_many :locations, through: :post_locations
  validates_presence_of :title, :description
  mount_uploader :main_photo, MainPhotoUploader
  acts_as_taggable
  
  def givable?
    commitments.empty? || commitments.last.status == :failure
  end

  def status
    if (self.updated_at - Time.now)/(60*60*24*30) > 30 #every psot expires after 30 days
      :expired
    elsif !commitments.empty? && commitments.last.status == :success
      :success
    elsif !commitments.empty? && commitments.last.status == :pending
      :pending
    else
      :progressing
    end
  end

  def self.search(search_term)
    result =[]
    if search_term.blank?
    elsif !(result = Post.tagged_with(search_term, wild: true, any: true)).empty?
    elsif Location.all.map(&:name).include? search_term
      result = Post.all.select{|post| post.locations.map(&:name).include? search_term}
    elsif ! (result = self.where("title LIKE ?", "%#{search_term}%")).empty?
    end
    result      
  end

end