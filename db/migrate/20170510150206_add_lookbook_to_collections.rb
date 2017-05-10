class AddLookbookToCollections < ActiveRecord::Migration[5.0]
  def change
    add_column :collections, :lookbook, :string
  end
end
