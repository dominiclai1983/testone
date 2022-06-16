# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_06_16_134629) do

  create_table "charges", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "checkout_session_id"
    t.string "currency"
    t.decimal "amount"
    t.boolean "complete"
    t.integer "orders_id"
    t.index ["orders_id"], name: "index_charges_on_orders_id"
  end

  create_table "order_details", force: :cascade do |t|
    t.decimal "price", precision: 10, scale: 2
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "orders_id"
    t.integer "products_id"
    t.index ["orders_id"], name: "index_order_details_on_orders_id"
    t.index ["products_id"], name: "index_order_details_on_products_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "order_date"
    t.datetime "shipping_date"
    t.string "status"
    t.string "recipient_name"
    t.string "shipping_address_1"
    t.string "shipping_address_2"
    t.string "postal_code"
    t.string "city"
    t.string "country"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "users_id"
    t.string "payment_status"
    t.index ["users_id"], name: "index_orders_on_users_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "sku"
    t.decimal "price", precision: 10, scale: 2
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string "token"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "users_id"
    t.index ["user_id"], name: "index_sessions_on_user_id"
    t.index ["users_id"], name: "index_sessions_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "usernamet"
    t.string "email"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "charges", "orders", column: "orders_id"
  add_foreign_key "order_details", "orders", column: "orders_id"
  add_foreign_key "order_details", "products", column: "products_id"
  add_foreign_key "orders", "users", column: "users_id"
  add_foreign_key "sessions", "users"
  add_foreign_key "sessions", "users", column: "users_id"
end
