class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.references :brand, foreign_key: true
      t.references :retailler, foreign_key: true
      t.integer :status
      t.integer :count
      t.float :total

      t.timestamps
    end
  end
end
