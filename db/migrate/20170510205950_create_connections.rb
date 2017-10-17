class CreateConnections < ActiveRecord::Migration[5.0]
  def change
    create_table :connections do |t|
      t.references :brand, foreign_key: true
      t.references :retailler, foreign_key: true
      t.references :showroom, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
