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

ActiveRecord::Schema.define(version: 20160605183959) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string   "choice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "created_by"
    t.integer  "user_id"
    t.integer  "prop_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "commenter"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "prop_id"
  end

  add_index "comments", ["prop_id"], name: "index_comments_on_prop_id", using: :btree

  create_table "props", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "choice"
    t.string   "answer"
    t.integer  "answerId"
    t.integer  "user_id"
    t.string   "propimage_file_name"
    t.string   "propimage_content_type"
    t.integer  "propimage_file_size"
    t.datetime "propimage_updated_at"
  end

  add_index "props", ["user_id"], name: "index_props_on_user_id", using: :btree

  create_table "user_answers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.integer  "score",               default: 0
    t.integer  "prop_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "password_digest"
    t.string   "created_by"
    t.boolean  "admin",               default: false
    t.integer  "answers_id"
    t.integer  "answer_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["answer_id"], name: "index_users_on_answer_id", using: :btree
  add_index "users", ["prop_id"], name: "index_users_on_prop_id", using: :btree

  add_foreign_key "comments", "props"
  add_foreign_key "props", "users"
  add_foreign_key "users", "answers"
  add_foreign_key "users", "props"
end
