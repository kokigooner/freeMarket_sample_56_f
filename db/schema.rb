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

ActiveRecord::Schema.define(version: 20190818052146) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "postal_code",      null: false
    t.string  "minicipality",     null: false
    t.string  "address",          null: false
    t.string  "building"
    t.string  "family_name",      null: false
    t.string  "first_name",       null: false
    t.string  "family_name_kana", null: false
    t.string  "first_name_kana",  null: false
    t.integer "prefecture_id",    null: false
    t.string  "phone_number"
    t.integer "user_id"
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "brand", null: false
  end

  create_table "brands_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "first_category_id"
    t.integer "brand_id"
    t.index ["brand_id"], name: "index_brands_categories_on_brand_id", using: :btree
    t.index ["first_category_id"], name: "index_brands_categories_on_first_category_id", using: :btree
  end

  create_table "cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",    null: false
    t.string   "customer",   null: false
    t.string   "card",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cards_on_user_id", using: :btree
  end

  create_table "first_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "first_category", null: false
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "image",      limit: 65535, null: false
    t.integer "product_id"
    t.index ["product_id"], name: "index_images_on_product_id", using: :btree
  end

  create_table "likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.integer  "like"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_likes_on_product_id", using: :btree
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id"
    t.string  "product_name",                     null: false
    t.integer "price",                            null: false
    t.text    "description",        limit: 65535, null: false
    t.string  "condition",                        null: false
    t.string  "delivery_charge",                  null: false
    t.string  "delivery_date",                    null: false
    t.string  "delivery_way",                     null: false
    t.string  "order_status"
    t.integer "likes_count"
    t.integer "first_category_id"
    t.integer "second_category_id"
    t.integer "third_category_id"
    t.integer "brand_id"
    t.integer "size_id"
    t.index ["brand_id"], name: "index_products_on_brand_id", using: :btree
    t.index ["first_category_id"], name: "index_products_on_first_category_id", using: :btree
    t.index ["second_category_id"], name: "index_products_on_second_category_id", using: :btree
    t.index ["size_id"], name: "index_products_on_size_id", using: :btree
    t.index ["third_category_id"], name: "index_products_on_third_category_id", using: :btree
    t.index ["user_id"], name: "index_products_on_user_id", using: :btree
  end

  create_table "second_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "second_category",   null: false
    t.integer "first_category_id"
    t.index ["first_category_id"], name: "index_second_categories_on_first_category_id", using: :btree
  end

  create_table "size_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "size_category", null: false
  end

  create_table "sizes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "size_category_id"
    t.string  "size",             null: false
    t.index ["size_category_id"], name: "index_sizes_on_size_category_id", using: :btree
  end

  create_table "sns_credentials", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sns_credentials_on_user_id", using: :btree
  end

  create_table "third_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "third_category",     null: false
    t.integer "second_category_id"
    t.index ["second_category_id"], name: "index_third_categories_on_second_category_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "nickname",                            null: false
    t.string   "family_name",                         null: false
    t.string   "first_name",                          null: false
    t.string   "family_name_kana",                    null: false
    t.string   "first_name_kana",                     null: false
    t.integer  "birth_year",                          null: false
    t.integer  "birth_month",                         null: false
    t.integer  "birth_day",                           null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "brands_categories", "brands"
  add_foreign_key "brands_categories", "first_categories"
  add_foreign_key "cards", "users"
  add_foreign_key "images", "products"
  add_foreign_key "likes", "products"
  add_foreign_key "likes", "users"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "first_categories"
  add_foreign_key "products", "second_categories"
  add_foreign_key "products", "sizes"
  add_foreign_key "products", "third_categories"
  add_foreign_key "products", "users"
  add_foreign_key "second_categories", "first_categories"
  add_foreign_key "sizes", "size_categories"
  add_foreign_key "sns_credentials", "users"
  add_foreign_key "third_categories", "second_categories"
end
