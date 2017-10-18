class CreateShowrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :showrooms do |t|
      t.string :name

      t.timestamps
    end
  end
end
