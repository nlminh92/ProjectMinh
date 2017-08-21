class AddSeenToConnections < ActiveRecord::Migration[5.0]
  def change
    add_column :connections, :seen, :integer
  end
end
