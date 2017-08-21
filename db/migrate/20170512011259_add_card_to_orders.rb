class AddCardToOrders < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :card, foreign_key: true
  end
end
