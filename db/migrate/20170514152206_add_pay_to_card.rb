class AddPayToCard < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :pay, :integer
  end
end
