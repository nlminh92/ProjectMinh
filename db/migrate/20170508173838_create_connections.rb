class CreateConnections < ActiveRecord::Migration[5.0]
  def change
    create_table :connections do |t|
      t.integer :brand_follow_id
      t.integer :brand_following_id

      t.timestamps
    end
  end
end
