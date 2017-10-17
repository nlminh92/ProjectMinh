class CreateAddDescriptionToShowrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :add_description_to_showrooms do |t|

      t.timestamps
    end
  end
end
