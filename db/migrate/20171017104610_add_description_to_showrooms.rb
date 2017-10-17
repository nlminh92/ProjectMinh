class AddDescriptionToShowrooms < ActiveRecord::Migration[5.0]
  def change
    add_column :showrooms, :logo, :string
    add_column :showrooms, :description, :text
    add_column :showrooms, :facebook, :string
    add_column :showrooms, :instagram, :string
  end
end
