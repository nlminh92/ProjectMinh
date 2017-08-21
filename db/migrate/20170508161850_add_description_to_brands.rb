class AddDescriptionToBrands < ActiveRecord::Migration[5.0]
  def change
    add_column :brands, :logo, :string
    add_column :brands, :description, :text
    add_column :brands, :facebook, :string
    add_column :brands, :instagram, :string
  end
end
