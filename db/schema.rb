# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_15_110952) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "items_id"
    t.index ["items_id"], name: "index_carts_on_items_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "catches", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "fish_id", null: false
    t.integer "weight"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fish_id"], name: "index_catches_on_fish_id"
    t.index ["user_id"], name: "index_catches_on_user_id"
  end

  create_table "fish", force: :cascade do |t|
    t.string "scientific"
    t.string "english"
    t.string "lebanese"
    t.string "water"
    t.string "texture"
    t.string "flavor"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "bake"
    t.boolean "broil"
    t.boolean "fry"
    t.boolean "grill"
    t.boolean "poach"
    t.boolean "saute"
    t.boolean "smoke"
    t.boolean "steam"
    t.boolean "sushi"
    t.boolean "cooking"
  end

  create_table "items", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "cart_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_items_on_cart_id"
    t.index ["product_id"], name: "index_items_on_product_id"
  end

  create_table "locations", force: :cascade do |t|
    t.bigint "user_id"
    t.string "lat"
    t.string "long"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "product_id", null: false
    t.bigint "location_id", null: false
    t.boolean "done", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "accepted", default: false
    t.boolean "picked", default: false
    t.boolean "reviewed", default: false
    t.index ["location_id"], name: "index_orders_on_location_id"
    t.index ["product_id"], name: "index_orders_on_product_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "catch_id", null: false
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "bought", default: false
    t.bigint "user_id", null: false
    t.boolean "done", default: false
    t.index ["catch_id"], name: "index_products_on_catch_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content"
    t.integer "rating"
    t.bigint "reviewer_id"
    t.bigint "fisherman_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fisherman_id"], name: "index_reviews_on_fisherman_id"
    t.index ["reviewer_id"], name: "index_reviews_on_reviewer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.boolean "fisherman", default: false
    t.boolean "consumer", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.text "object_changes"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "carts", "items", column: "items_id"
  add_foreign_key "carts", "users"
  add_foreign_key "catches", "fish"
  add_foreign_key "catches", "users"
  add_foreign_key "items", "carts"
  add_foreign_key "items", "products"
  add_foreign_key "locations", "users"
  add_foreign_key "orders", "locations"
  add_foreign_key "orders", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "catches"
  add_foreign_key "products", "users"
  add_foreign_key "reviews", "users", column: "fisherman_id"
  add_foreign_key "reviews", "users", column: "reviewer_id"
end
