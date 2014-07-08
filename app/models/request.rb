class Request < ActiveRecord::Base
  belongs_to :post
  belongs_to :creator, foreign_key: 'user_id', class_name:"User"
  validates :body, presence:true

  validates :user_id, uniqueness: { scope: :post_id}
end