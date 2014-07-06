class AddRecieverRefAndPostRefToCommitments < ActiveRecord::Migration
  def change
    add_column :commitments, :reciever_id, :integer
    add_reference :commitments, :post, index: true
  end
end
