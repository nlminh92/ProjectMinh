class AddShowroomToConnections < ActiveRecord::Migration[5.0]
  def change
    add_column :connections, :showroom, :integer, foreign_key: true
  end
end
