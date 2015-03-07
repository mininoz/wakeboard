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

ActiveRecord::Schema.define(version: 20150305231204) do

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
  end

  add_index "listings", ["seller_id"], name: "index_listings_on_seller_id"

end
