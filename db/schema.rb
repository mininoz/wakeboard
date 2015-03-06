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

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.decimal  "price",            default: 0.0
    t.text     "description"
    t.boolean  "active",           default: true
    t.boolean  "sold",             default: false
    t.integer  "seller_id"
    t.integer  "productable_id"
    t.string   "productable_type"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "products", ["productable_type", "productable_id"], name: "index_products_on_productable_type_and_productable_id"
  add_index "products", ["seller_id"], name: "index_products_on_seller_id"

end
