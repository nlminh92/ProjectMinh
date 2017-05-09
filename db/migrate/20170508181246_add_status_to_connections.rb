class AddStatusToConnections < ActiveRecord::Migration[5.0]
  def change
    add_column :connections, :status, :boolean
  end
end
