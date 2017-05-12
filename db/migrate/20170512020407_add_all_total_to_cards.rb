class AddAllTotalToCards < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :all_total, :float
  end
end
