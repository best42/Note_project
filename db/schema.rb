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

ActiveRecord::Schema.define(version: 20160318100836) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "x"
    t.integer  "y"
    t.integer  "user_id"
    t.integer  "note_image_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "rating"
  end

  add_index "comments", ["note_image_id"], name: "index_comments_on_note_image_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "note_images", force: :cascade do |t|
    t.integer  "image_id"
    t.integer  "x"
    t.integer  "y"
    t.text     "content"
    t.integer  "note_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "note_images", ["image_id"], name: "index_note_images_on_image_id", using: :btree
  add_index "note_images", ["note_id"], name: "index_note_images_on_note_id", using: :btree

  create_table "notes", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "subject"
    t.text     "teacher"
    t.integer  "rating"
    t.integer  "user_id"
    t.date     "create_note"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "notes", ["user_id"], name: "index_notes_on_user_id", using: :btree

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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "comments", "note_images"
  add_foreign_key "comments", "users"
  add_foreign_key "note_images", "notes"
  add_foreign_key "notes", "users"
end
