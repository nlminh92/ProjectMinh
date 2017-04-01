class CreateRetaillers < ActiveRecord::Migration[5.0]
  def change
    create_table :retaillers do |t|
      t.string :name

      t.timestamps
    end
  end
end
