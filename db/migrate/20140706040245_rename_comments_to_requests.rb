class RenameCommentsToRequests < ActiveRecord::Migration
  def change
    rename_table :comments, :requests
  end
end
