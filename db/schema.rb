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

ActiveRecord::Schema.define(version: 20171127032659) do

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.string   "state"
    t.string   "country"
    t.string   "location_key"
    t.string   "zip"
    t.text     "daily_data"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "lat"
    t.string   "lng"
    t.integer  "user_id"
  end

  add_index "cities", ["user_id"], name: "index_cities_on_user_id"

  create_table "markers", force: :cascade do |t|
    t.string   "lng"
    t.string   "lat"
    t.string   "title"
    t.boolean  "dog"
    t.boolean  "cat"
    t.boolean  "mold"
    t.boolean  "bees"
    t.boolean  "perfume"
    t.boolean  "oak"
    t.boolean  "dust"
    t.boolean  "smoke"
    t.boolean  "gluten"
    t.boolean  "peanut"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "markers", ["user_id"], name: "index_markers_on_user_id"

  create_table "users", force: :cascade do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
    t.text     "description"
    t.string   "title"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "name"
    t.string   "searches"
    t.string   "email"
    t.string   "recent_cities"
  end

end
