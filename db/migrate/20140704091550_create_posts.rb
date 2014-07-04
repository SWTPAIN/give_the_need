class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string  :title
      t.text  :description
      t.string :main_photo

      t.timestamps
    end
  end
end
