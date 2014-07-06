class Commitment < ActiveRecord::Base
  belongs_to :post
  belongs_to :reciever, class_name: 'User', foreign_key: 'receiver_id'
end