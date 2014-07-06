class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # validates_presence_of :username
  validates :username, presence: true, uniqueness: true
  has_many :posts
  has_many :commitments, foreign_key: 'receiver_id', class_name: 'Commitment'
  has_many :requests

  def pending_receipts
    commitments.select {|commitment| commitment.status == :pending }
  end
  def pending_givings
    pending_givings = posts.map do |post|
      post.commitments.last if  (post.commitments.present? && post.commitments.last.status == :pending)
    end
    pending_givings.compact
  end

  def successful_receipts
    commitments.select { |commitment| commitment.status == :success }
  end

  def successful_givings
    successful_givings = posts.map do |post|
      post.commitments.last if  (post.commitments.present? && post.commitments.last.status == :success)
    end
    successful_givings.compact
  end


end
