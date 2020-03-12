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

ActiveRecord::Schema.define(version: 2020_03_12_190001) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.text "description"
    t.string "address"
    t.string "title"
    t.date "date"
    t.time "time"
    t.bigint "flat_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flat_user_id"], name: "index_events_on_flat_user_id"
  end

  create_table "flat_users", force: :cascade do |t|
    t.bigint "flat_id"
    t.bigint "user_id"
    t.boolean "owner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "flat_code"
    t.index ["flat_id"], name: "index_flat_users_on_flat_id"
    t.index ["user_id"], name: "index_flat_users_on_user_id"
  end

  create_table "flats", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "address"
    t.string "flat_code"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_flats_on_user_id"
  end

  create_table "note_answers", force: :cascade do |t|
    t.string "content"
    t.bigint "flat_user_id"
    t.bigint "note_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flat_user_id"], name: "index_note_answers_on_flat_user_id"
    t.index ["note_id"], name: "index_note_answers_on_note_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "content"
    t.bigint "flat_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flat_user_id"], name: "index_notes_on_flat_user_id"
  end

  create_table "participations", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "flat_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_participations_on_event_id"
    t.index ["flat_user_id"], name: "index_participations_on_flat_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "events", "flat_users"
  add_foreign_key "flat_users", "flats"
  add_foreign_key "flat_users", "users"
  add_foreign_key "flats", "users"
  add_foreign_key "note_answers", "flat_users"
  add_foreign_key "note_answers", "notes"
  add_foreign_key "notes", "flat_users"
  add_foreign_key "participations", "events"
  add_foreign_key "participations", "flat_users"
end
