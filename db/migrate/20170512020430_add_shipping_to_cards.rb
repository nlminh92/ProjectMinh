class AddShippingToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :shipping, :float
  end
end
