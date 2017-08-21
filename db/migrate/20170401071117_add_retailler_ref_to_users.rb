class AddRetaillerRefToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :retailler, foreign_key: true
  end
end
