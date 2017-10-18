class AddColumnToBrands < ActiveRecord::Migration[5.0]
  def change
    add_column :brands, :accept, :integer
    add_reference :brands, :showroom, foreign_key: true
  end
end
