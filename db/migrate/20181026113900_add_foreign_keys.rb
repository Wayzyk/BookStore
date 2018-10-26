class AddForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :order_items, :books
    add_foreign_key :order_items, :orders
    add_foreign_key :orders, :order_statuses
  end
end
