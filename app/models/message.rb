class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :recepient, class_name: 'User', foreign_key: 'recepient_id'
  validates :subject, presence: true
  validates :body, presence: true
  validates :recepient_id, presence: true
  validates :sender_id, presence: true


  def mark_deleted(user)
    self.sender_deleted = true if sender == user
    self.recepient_deleted = true if recepient == user
    self.sender_deleted && self.recepient_deleted ? self.destroy : self.save
  end

  def self.reading_message(message, user)
    if message.read_at.nil? && message.recepient == user
      message.read_at = Time.now
      message.save
    end
    message
  end

  def read?
    !self.read_at.nil?
  end
end