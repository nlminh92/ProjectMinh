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

ActiveRecord::Schema.define(version: 20170514152206) do

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "logo"
    t.text     "description", limit: 65535
    t.string   "facebook"
    t.string   "instagram"
    t.string   "location"
    t.string   "contact"
  end

  create_table "cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "brand_id"
    t.integer  "retailler_id"
    t.integer  "status"
    t.integer  "count"
    t.float    "total",        limit: 24
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.float    "all_total",    limit: 24
    t.float    "shipping",     limit: 24
    t.integer  "pay"
    t.index ["brand_id"], name: "index_cards_on_brand_id", using: :btree
    t.index ["retailler_id"], name: "index_cards_on_retailler_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "collections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name_collections"
    t.datetime "date_availability"
    t.text     "description",       limit: 65535
    t.string   "image"
    t.boolean  "status",                          default: false
    t.integer  "brand_id"
    t.integer  "retailler_id"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "lookbook"
    t.index ["brand_id"], name: "index_collections_on_brand_id", using: :btree
    t.index ["retailler_id"], name: "index_collections_on_retailler_id", using: :btree
  end

  create_table "connections", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "brand_id"
    t.integer  "retailler_id"
    t.integer  "status"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "seen"
    t.index ["brand_id"], name: "index_connections_on_brand_id", using: :btree
    t.index ["retailler_id"], name: "index_connections_on_retailler_id", using: :btree
  end

  create_table "countries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "number"
    t.float    "price",      limit: 24
    t.integer  "product_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "card_id"
    t.index ["card_id"], name: "index_orders_on_card_id", using: :btree
    t.index ["product_id"], name: "index_orders_on_product_id", using: :btree
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name_products"
    t.boolean  "status",                           default: false
    t.string   "image"
    t.string   "gender"
    t.string   "supplier_sku"
    t.string   "type_sell"
    t.string   "code"
    t.string   "season"
    t.string   "description"
    t.datetime "date_availability"
    t.string   "country"
    t.decimal  "price",             precision: 10
    t.string   "size"
    t.integer  "discount"
    t.string   "variants"
    t.boolean  "on_sale",                          default: false
    t.integer  "brand_id"
    t.integer  "retailler_id"
    t.integer  "collection_id"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.boolean  "active"
    t.index ["brand_id"], name: "index_products_on_brand_id", using: :btree
    t.index ["collection_id"], name: "index_products_on_collection_id", using: :btree
    t.index ["retailler_id"], name: "index_products_on_retailler_id", using: :btree
  end

  create_table "producttypes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "retaillers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "logo"
    t.text     "description", limit: 65535
    t.string   "facebook"
    t.string   "instagram"
  end

  create_table "selltypes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                                default: "",    null: false
    t.string   "encrypted_password",                   default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "company"
    t.string   "website"
    t.text     "address",                limit: 65535
    t.integer  "zip_code"
    t.string   "country"
    t.string   "member_registration"
    t.string   "firstname_contact"
    t.string   "lastname_contact"
    t.integer  "phone"
    t.text     "description",            limit: 65535
    t.boolean  "activated",                            default: false
    t.text     "brands_carried",         limit: 65535
    t.integer  "type_user",                            default: 0
    t.integer  "brand_id"
    t.integer  "retailler_id"
    t.string   "avatar"
    t.index ["brand_id"], name: "index_users_on_brand_id", using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["retailler_id"], name: "index_users_on_retailler_id", using: :btree
  end

  add_foreign_key "cards", "brands"
  add_foreign_key "cards", "retaillers"
  add_foreign_key "collections", "brands"
  add_foreign_key "collections", "retaillers"
  add_foreign_key "connections", "brands"
  add_foreign_key "connections", "retaillers"
  add_foreign_key "orders", "cards"
  add_foreign_key "orders", "products"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "collections"
  add_foreign_key "products", "retaillers"
  add_foreign_key "users", "brands"
  add_foreign_key "users", "retaillers"
end
