class CreateCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :collections do |t|
      t.string :name_collections
      t.datetime :date_availability
      t.text :description
      t.string :image
      t.boolean :status, default: false
      t.references :brand, foreign_key: true
      t.references :retailler, foreign_key: true

      t.timestamps
    end
  end
end
