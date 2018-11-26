class AddYearOfPublishToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :year_of_publish, :integer
  end
end
