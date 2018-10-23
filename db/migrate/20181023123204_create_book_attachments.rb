class CreateBookAttachments < ActiveRecord::Migration[5.2]
  def change
    create_table :book_attachments do |t|
        t.string  :picture
        t.integer :book_id
    end
  end
end
