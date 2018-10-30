class RemoveFieldsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :address, :string
    remove_column :users, :city, :string
    remove_column :users, :zip, :integer
    remove_column :users, :country, :string
    remove_column :users, :phone, :integer
  end
end
