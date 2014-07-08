require 'rails_helper'

describe Message do
  describe '#mark_deleted' do
    it 'sets the attribute of sender_deleted to true when sender passed as argument' do
      alice = Fabricate(:user)
      alice.confirm!
      bob = Fabricate(:user)
      bob.confirm!
      message = alice.sent_messages.create(recepient: bob, subject: "Hello Bob", body: 'Hihi')
      message.mark_deleted(alice)
      expect(message.reload.sender_deleted).to be true
    end
    it 'sets the attribute of recepient_deleted to true when recepient passed as argument' do
      alice = Fabricate(:user)
      alice.confirm!
      bob = Fabricate(:user)
      bob.confirm!
      message = alice.sent_messages.create(recepient: bob, subject: "Hello Bob", body: 'Hihi')
      message.mark_deleted(bob)
      expect(message.reload.recepient_deleted).to be true
    end
    it 'deleted the message when both recepient_deleted abd sender_deleted is true' do
      alice = Fabricate(:user)
      alice.confirm!
      bob = Fabricate(:user)
      bob.confirm!
      message = alice.sent_messages.create(recepient: bob, subject: "Hello Bob", body: 'Hihi')
      message.mark_deleted(bob)
      message.mark_deleted(alice)
      expect(Message.first).to be nil
    end
  end
end