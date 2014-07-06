class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # validates_presence_of :username
  validates :username, presence: true, uniqueness: true
  has_many :posts
  has_many :commitments
  has_many :requests
end
