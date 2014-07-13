class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :recepient, class_name: 'User', foreign_key: 'recepient_id'
  validates :subject, presence: true
  validates :body, presence: true
  validates :recepient_id, presence: true
  validates :sender_id, presence: true

  def self.sending_system_notice(commitment)
    if commitment.status == :pending
      User.find_by_username('System').sent_messages.create(recepient: commitment.receiver,
                                                         subject: 'Your request is accepted',
                                                         body: "Please note that your request of #{commitment.post.title} is accepted. You may contact the giver.")
    elsif commitment.status == :failure
      User.find_by_username('System').sent_messages.create(recepient: commitment.receiver,
                                                         subject: 'Your commitment does not succeed',
                                                         body: "Please note that your commitment of #{commitment.post.title} does not succeed due to the failure response given by you or the giver.")
      User.find_by_username('System').sent_messages.create(recepient: commitment.giver,
                                                         subject: 'Your commitment does not succeed',
                                                         body: "Please note that your commitment of #{commitment.post.title} does not succeed due to the failure response given by you or the receiver.")
    end
      
  end

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