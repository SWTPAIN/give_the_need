class RenameRecieverToReceiverId < ActiveRecord::Migration
  def change
    rename_column :commitments, :reciever_id, :receiver_id
  end
end
