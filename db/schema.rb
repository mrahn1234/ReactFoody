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

ActiveRecord::Schema.define(version: 2019_11_10_025012) do

  create_table "carts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "status", default: 3
    t.float "checkout"
    t.datetime "buyTime"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.boolean "classify"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "product_id"
    t.bigint "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_items_on_cart_id"
    t.index ["product_id"], name: "index_items_on_product_id"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.float "price"
    t.integer "rate"
    t.boolean "classify"
    t.integer "quantity"
    t.string "description"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "reviews", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "comment"
    t.integer "rate"
    t.bigint "user_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_reviews_on_product_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "phone", default: ""
    t.string "avatar", default: ""
    t.integer "role", default: 2
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "carts", "users"
  add_foreign_key "items", "carts"
  add_foreign_key "items", "products"
  add_foreign_key "products", "categories"
  add_foreign_key "reviews", "products"
  add_foreign_key "reviews", "users"
end
