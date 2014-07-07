class CreatePostLocations < ActiveRecord::Migration
  def change
    create_table :post_locations do |t|
      t.integer :post_id, :location_id
      t.timestamps
    end
  end
end
