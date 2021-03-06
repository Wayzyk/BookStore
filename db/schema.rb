# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_11_27_154344) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "type"
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "city"
    t.integer "zip"
    t.string "country"
    t.integer "phone"
    t.integer "user_id"
    t.integer "order_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "bio"
  end

  create_table "book_attachments", force: :cascade do |t|
    t.string "picture"
    t.integer "book_id"
  end

  create_table "book_authors", force: :cascade do |t|
    t.bigint "author_id"
    t.bigint "book_id"
    t.index ["author_id"], name: "index_book_authors_on_author_id"
    t.index ["book_id"], name: "index_book_authors_on_book_id"
  end

  create_table "book_categories", force: :cascade do |t|
    t.bigint "book_id"
    t.bigint "category_id"
    t.index ["book_id"], name: "index_book_categories_on_book_id"
    t.index ["category_id"], name: "index_book_categories_on_category_id"
  end

  create_table "books", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.float "price"
    t.text "description"
    t.string "materials"
    t.decimal "height"
    t.decimal "width"
    t.decimal "length"
    t.integer "year_of_publish"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.decimal "amount", default: "0.0"
    t.integer "limit", default: 0
    t.date "expiration"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "used", default: 0, null: false
  end

  create_table "credit_cards", force: :cascade do |t|
    t.string "credit_card_number"
    t.integer "month"
    t.integer "year"
    t.integer "cvv"
    t.string "card_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_id"
  end

  create_table "deliveries", force: :cascade do |t|
    t.string "method"
    t.integer "max_days"
    t.integer "min_days"
    t.decimal "delivery_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "book_id"
    t.bigint "order_id"
    t.decimal "unit_price", precision: 12, scale: 2
    t.integer "quantity", default: 1
    t.decimal "total_price", precision: 12, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_order_items_on_book_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.decimal "subtotal", precision: 12, scale: 2
    t.decimal "total", precision: 12, scale: 2
    t.bigint "order_status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "coupon_id"
    t.integer "delivery_id"
    t.integer "user_id"
    t.integer "credit_card_id"
    t.index ["order_status_id"], name: "index_orders_on_order_status_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.string "title"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "book_id"
    t.boolean "approved", default: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "order_items", "books"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "order_statuses"
end
