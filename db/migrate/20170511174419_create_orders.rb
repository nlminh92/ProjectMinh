class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :number
      t.float :price
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
