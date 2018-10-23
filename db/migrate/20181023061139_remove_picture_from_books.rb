class RemovePictureFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :picture, :string
  end
end
