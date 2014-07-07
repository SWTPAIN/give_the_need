class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :recepient_id
      t.boolean :sender_deleted, :recepient_deleted, default: false
      t.string :subject
      t.text :body
      t.datetime :read_at
      t.timestamps
    end
  end
end
