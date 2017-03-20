class CreateCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :collections do |t|
      t.string :name_collections
      t.datetime :date_availability
      t.text :description
      t.string :image
      t.boolean :status, default: false
      t.string :brands_id
      t.string :retaillers_id

      t.timestamps
    end
  end
end
