class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.bigint "book_id"
      t.bigint "order_id"
      t.decimal "unit_price", precision: 12, scale: 2
      t.integer "quantity"
      t.decimal "total_price", precision: 12, scale: 2
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["book_id"], name: "index_order_items_on_book_id"
      t.index ["order_id"], name: "index_order_items_on_order_id"
    end
  end
end
