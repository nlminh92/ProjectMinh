class DropTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :add_description_to_showrooms
  end
end
