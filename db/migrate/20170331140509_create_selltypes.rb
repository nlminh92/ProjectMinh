class CreateSelltypes < ActiveRecord::Migration[5.0]
  def change
    create_table :selltypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
