class AddContactToBrands < ActiveRecord::Migration[5.0]
  def change
    add_column :brands, :contact, :string
  end
end
