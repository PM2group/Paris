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

ActiveRecord::Schema.define(version: 2018_12_02_024552) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "com_name"
    t.string "occupations"
    t.string "location"
    t.string "com_info", null: false
    t.string "condition"
    t.integer "salary"
    t.string "password_digest"
    t.string "frame"
    t.string "lang"
    t.string "adoption"
    t.text "appeal"
    t.string "system"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "mem_name"
    t.string "user_name"
    t.string "mem_info", null: false
    t.date "mem_birth"
    t.date "mem_gra"
    t.string "des_occupation"
    t.string "des_location"
    t.string "password_digest"
    t.string "pic"
    t.string "univercity"
    t.string "circle"
    t.string "labo"
    t.string "study"
    t.string "deliver"
    t.string "activity"
    t.string "qualification"
    t.string "lang_experience"
    t.string "system_ex"
    t.string "flame_ex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
