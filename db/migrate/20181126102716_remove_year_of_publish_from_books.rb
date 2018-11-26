class RemoveYearOfPublishFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :year_of_publish, :date
  end
end
