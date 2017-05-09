class AddDescriptionToRetaillers < ActiveRecord::Migration[5.0]
  def change
    add_column :retaillers, :logo, :string
    add_column :retaillers, :description, :text
    add_column :retaillers, :facebook, :string
    add_column :retaillers, :instagram, :string
  end
end
