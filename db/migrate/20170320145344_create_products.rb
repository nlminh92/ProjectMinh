class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name_products
      t.boolean :status, default: false
      t.string :image
      t.string :gender
      t.string :supplier_sku
      t.string :type_sell
      t.string :code
      t.string :season
      t.string :description
      t.datetime :date_availability
      t.string :country
      t.decimal :price
      t.string :size
      t.integer :discount
      t.string :variants
      t.boolean :on_sale, default: false
      t.references :brand, foreign_key: true
      t.references :retailler, foreign_key: true
      t.references :collection, foreign_key: true

      t.timestamps
    end
  end
end
