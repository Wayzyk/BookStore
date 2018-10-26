class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.decimal "subtotal", precision: 12, scale: 2
      t.decimal "total", precision: 12, scale: 2
      t.bigint "order_status_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["order_status_id"], name: "index_orders_on_order_status_id"
    end
  end
end
