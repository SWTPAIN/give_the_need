class CreateCommitments < ActiveRecord::Migration
  def change
    create_table :commitments do |t|
      t.boolean :giver_response, :receiver_response
      t.timestamps
    end
  end
end
