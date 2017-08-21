class AddCollumnToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :company, :string
    add_column :users, :website, :string
    add_column :users, :address, :text
    add_column :users, :zip_code, :integer
    add_column :users, :country, :string
    add_column :users, :member_registration, :string
    add_column :users, :firstname_contact, :string
    add_column :users, :lastname_contact, :string
    add_column :users, :phone, :integer
    add_column :users, :description, :text
    add_column :users, :activated, :boolean, default: false
    add_column :users, :brands_carried, :text
    add_column :users, :type_user, :integer, default: false
  end
end
