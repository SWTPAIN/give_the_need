class Commitment < ActiveRecord::Base
  belongs_to :post
  belongs_to :receiver, foreign_key: 'receiver_id', class_name: 'User'

  def status
    if giver_response  && receiver_response
      :success
    elsif giver_response == false || receiver_response == false
      :failure
    else
      :pending
    end
  end

  def giver
    post.user
  end

end