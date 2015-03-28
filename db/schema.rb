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

ActiveRecord::Schema.define(version: 20150328161326) do

  create_table "listings", force: :cascade do |t|
    t.string   "title"
    t.decimal  "price",               default: 0.0
    t.text     "description"
    t.string   "wake_board_brand"
    t.integer  "wake_board_size"
    t.string   "wake_board_material"
    t.integer  "wake_board_year"
    t.string   "boot_brand"
    t.integer  "boot_size"
    t.string   "wake_skate_brand"
    t.integer  "wake_skate_size"
    t.string   "wake_skate_material"
    t.integer  "wake_skate_year"
    t.string   "helmet_brand"
    t.string   "helmet_size"
    t.string   "vest_brand"
    t.string   "vest_size"
    t.boolean  "active",              default: true
    t.boolean  "sold",                default: false
    t.integer  "seller_id"
    t.string   "type"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "boot_year"
  end

  add_index "listings", ["seller_id"], name: "index_listings_on_seller_id"

  create_table "photos", force: :cascade do |t|
    t.integer  "listing_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "photos", ["listing_id"], name: "index_photos_on_listing_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
