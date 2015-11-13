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
    t.string   "major"
    t.integer  "user_id"
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

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",          null: false
    t.string   "encrypted_password",     default: "",          null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,           null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        default: 0,           null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "username",               default: "anonymous"
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true

end
