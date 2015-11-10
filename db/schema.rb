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

ActiveRecord::Schema.define(version: 20151110104811) do

  create_table "articles", force: true do |t|
    t.string   "username"
    t.text     "url"
    t.string   "genre"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friends", force: true do |t|
    t.string   "username"
    t.string   "friendname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "my_trends", force: true do |t|
    t.string   "username"
    t.string   "one"
    t.string   "two"
    t.string   "three"
    t.string   "four"
    t.string   "five"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", force: true do |t|
    t.string   "username"
    t.integer  "game"
    t.integer  "anime"
    t.integer  "economy"
    t.integer  "entame"
    t.integer  "sports"
    t.integer  "tech"
    t.integer  "life"
    t.integer  "tour"
    t.integer  "gourmet"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trends", force: true do |t|
    t.string   "username"
    t.string   "noun"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
