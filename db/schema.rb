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

ActiveRecord::Schema.define(version: 0) do

  create_table "ar_internal_metadata", primary_key: "key", force: :cascade do |t|
    t.string   "value",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "area", force: :cascade do |t|
    t.string "areaname", limit: 30, null: false
  end

  create_table "area_district", force: :cascade do |t|
    t.string "area_id",            limit: 30
    t.string "area_district_name", limit: 30, null: false
  end

  add_index "area_district", ["area_id"], name: "area_id", unique: true, using: :btree

  create_table "category", force: :cascade do |t|
    t.string "cateroyname", limit: 50, null: false
  end

  create_table "comment", force: :cascade do |t|
    t.string "user_id", limit: 30,    null: false
    t.text   "body",    limit: 65535
  end

  create_table "seller", primary_key: "ID", force: :cascade do |t|
    t.string "seller_name",      limit: 50,    null: false
    t.string "category_id",      limit: 50,    null: false
    t.text   "content",          limit: 65535, null: false
    t.string "comment_id",       limit: 50,    null: false
    t.string "area_district_id", limit: 30,    null: false
  end

  add_index "seller", ["area_district_id"], name: "area_district_id", unique: true, using: :btree
  add_index "seller", ["category_id"], name: "category_id", unique: true, using: :btree
  add_index "seller", ["comment_id"], name: "comment_id", unique: true, using: :btree

  create_table "star", force: :cascade do |t|
    t.integer "score",     limit: 4,  null: false
    t.string  "seller_id", limit: 30, null: false
  end

  create_table "user", force: :cascade do |t|
    t.string "username",    limit: 30, null: false
    t.string "favorite_id", limit: 50, null: false
  end

  add_foreign_key "area", "area_district", column: "id", primary_key: "area_id", name: "area_id_fk"
  add_foreign_key "area_district", "seller", column: "id", primary_key: "area_district_id", name: "area_district_fk"
  add_foreign_key "category", "seller", column: "id", primary_key: "category_id", name: "CATEGORY_fk"
  add_foreign_key "comment", "seller", column: "id", primary_key: "comment_id", name: "comment_id_fk"
  add_foreign_key "star", "seller", column: "id", primary_key: "ID", name: "star_fk"
end
