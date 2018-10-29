class AddPropertiesToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :height, :decimal
    add_column :books, :width, :decimal
    add_column :books, :length, :decimal
  end
end
