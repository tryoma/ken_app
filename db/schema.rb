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

ActiveRecord::Schema.define(version: 20200726004302) do

  create_table "events", force: :cascade do |t|
    t.date "event_day"
    t.datetime "start_time"
    t.datetime "finish_time"
    t.integer "prefecture"
    t.string "prefecture_search"
    t.string "place"
    t.integer "estimate_people"
    t.integer "level", default: 0, null: false
    t.integer "organizer_user_id"
    t.string "organizer_name"
    t.string "organizer_tel"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "members", force: :cascade do |t|
    t.string "member_name"
    t.integer "user_id"
    t.boolean "attendance", default: false
    t.string "note"
    t.integer "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_members_on_event_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "image_name"
    t.date "birth_day"
    t.integer "grade"
    t.integer "prefecture"
    t.string "dojo"
    t.string "junior_high"
    t.string "high"
    t.string "university"
    t.string "affilation"
    t.string "history"
    t.string "signature"
    t.integer "frequency"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
