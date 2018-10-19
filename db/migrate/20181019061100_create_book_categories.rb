class CreateBookCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :book_categories do |t|
      t.belongs_to :book
      t.belongs_to :category
    end
  end
end
