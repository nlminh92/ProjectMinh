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

ActiveRecord::Schema.define(version: 20170320111746) do

  create_table "brands", force: :cascade do |t|
    t.string   "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collections", force: :cascade do |t|
    t.string   "name_collections"
    t.datetime "date_availability"
    t.text     "description"
    t.string   "image"
    t.boolean  "status",            default: false
    t.string   "brands_id"
    t.string   "retaillers_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name_products"
    t.boolean  "status",            default: false
    t.string   "image"
    t.string   "gender"
    t.string   "type"
    t.string   "type_sell"
    t.string   "code"
    t.string   "season"
    t.text     "description"
    t.datetime "date_availability"
    t.string   "country"
    t.decimal  "price"
    t.string   "size"
    t.integer  "disccount"
    t.string   "variants"
    t.boolean  "on_sale",           default: false
    t.string   "brands_id"
    t.string   "retaillers_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "retaillers", force: :cascade do |t|
    t.string   "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "company"
    t.string   "website"
    t.text     "address"
    t.integer  "zip_code"
    t.string   "country"
    t.string   "member_registration"
    t.string   "firstname_contact"
    t.string   "lastname_contact"
    t.integer  "phone"
    t.text     "description"
    t.boolean  "activated",              default: false
    t.text     "brands_carried"
    t.boolean  "type",                   default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
