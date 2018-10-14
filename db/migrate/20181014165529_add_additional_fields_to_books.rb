class AddAdditionalFieldsToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :description, :text
    add_column :books, :year_of_publish, :date
    add_column :books, :dimensions, :string
    add_column :books, :materials, :string
  end
end
