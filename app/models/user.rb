class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  validates :username, presence: true, uniqueness: true
  has_many :posts
  has_many :commitments, foreign_key: 'receiver_id', class_name: 'Commitment'
  has_many :requests
  has_many :sent_messages, foreign_key: 'sender_id', class_name: 'Message'
  has_many :received_messages, foreign_key: 'recepient_id', class_name: 'Message'

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

  def unread_message
    received_messages.select{|message| !message.read?}
  end

  def unread_message_count
    unread_message.count
  end

  def displayable_sent_messages
    sent_messages.select{|message| message.sender_deleted == false}
  end

  def displayable_received_messages
    received_messages.select{|message| message.recepient_deleted == false}
  end
end
