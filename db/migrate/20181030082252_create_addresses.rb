class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string  :type
      t.string  :first_name
      t.string  :last_name
      t.string  :address
      t.string  :city
      t.integer :zip
      t.string  :country
      t.integer :phone
    end
  end
end
