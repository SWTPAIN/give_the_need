module ApplicationHelper

  def total_number_of_request
    @total_number_of_request ||= Request.all.size + 1 
  end

  def total_number_of_post
    @total_number_of_post ||= Post.all.size + 1 
  end

  def total_number_of_giving
    @total_number_of_giving ||= Commitment.all.select{|commitment| commitment.status == :success}.length + 1
  end

  def total_number_of_receipt
    total_number_of_giving
  end

  def displaying_receipt(receipt)
    "#{receipt.post.title} (giver: #{receipt.giver.username})"
  end

  def displaying_giving(giving)
    "#{giving.post.title} (receiver: #{giving.receiver.username})"
  end

end
