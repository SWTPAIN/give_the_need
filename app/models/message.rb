class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :recepient, class_name: 'User', foreign_key: 'recepient_id'

  def mark_message_deleted(user)
    sender_deleted = true if sender == user
    recepient_deleted = true if recepient == user
    sender_deleted && recepient_deleted ? self.destroy : self.save
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