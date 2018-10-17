class CreateBookAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :book_authors do |t|
      t.belongs_to :author
      t.belongs_to :book
    end
  end
end
