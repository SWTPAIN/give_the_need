class Location < ActiveRecord::Base
  has_many :post_locations
  has_many :posts, through: :post_locations 
end