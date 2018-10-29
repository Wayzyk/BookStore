class RemoveDimensionsColumnFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :dimensions, :string
  end
end
