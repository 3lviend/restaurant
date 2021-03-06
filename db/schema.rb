# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151029103457) do

  create_table "additionals", force: :cascade do |t|
    t.string   "additional_type", limit: 255
    t.float    "amount",          limit: 24
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "active",          limit: 1
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.decimal  "quantity",                       precision: 10
    t.string   "detail_of_quantity", limit: 255
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.text     "detail_of_item", limit: 65535
    t.decimal  "price",                        precision: 10
    t.integer  "portion",        limit: 4
    t.string   "type_of_item",   limit: 255
    t.boolean  "available",      limit: 1,                    default: true
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "item_id",    limit: 4
    t.float    "quantity",   limit: 24
    t.integer  "order_id",   limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.boolean  "complete",   limit: 1,  default: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "table_id",      limit: 4
    t.string   "status",        limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "total_payment", limit: 4
  end

  create_table "payment_methods", force: :cascade do |t|
    t.string   "payment_type", limit: 255
    t.float    "discount",     limit: 24
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.boolean  "active",       limit: 1
  end

  create_table "payments", force: :cascade do |t|
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "payment_number",    limit: 255
    t.integer  "payment_method_id", limit: 4
    t.integer  "order_id",          limit: 4
  end

  create_table "roles", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name",       limit: 255
  end

  create_table "tables", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "available",  limit: 1,   default: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "role_id",                limit: 4
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "access_token",           limit: 255, default: ""
  end

  add_index "users", ["access_token"], name: "index_users_on_access_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
