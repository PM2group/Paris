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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2018_12_04_113323) do
=======
ActiveRecord::Schema.define(version: 2018_12_06_212221) do
>>>>>>> doraemon/master

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

<<<<<<< HEAD
  create_table "companies", force: :cascade do |t|
    t.string "com_name", limit: 50, null: false
    t.string "occupations", limit: 100, null: false
    t.string "location", limit: 50, null: false
    t.string "com_info", limit: 30, null: false
    t.string "condition", limit: 100, null: false
    t.integer "salary", null: false
=======
  create_table "chat_pages", force: :cascade do |t|
    t.integer "designer_id", null: false
    t.string "designer_name", limit: 50, null: false
    t.date "period"
    t.integer "max_mem", null: false
    t.integer "join_mem", default: 0
    t.boolean "rec", default: true, null: false
    t.date "start_date"
    t.date "finish_date"
    t.string "theme", limit: 200, null: false
    t.boolean "readable", default: true
    t.string "password", limit: 30
    t.string "page_url"
    t.date "update", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chat_states", force: :cascade do |t|
    t.date "remark_date", null: false
    t.integer "mem_id", null: false
    t.string "mem_name", null: false
    t.text "sentence", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "chat_page_id", null: false
    t.index ["chat_page_id"], name: "index_chat_states_on_chat_page_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "com_name"
    t.string "occupations"
    t.string "location"
    t.string "com_info", null: false
    t.string "condition"
    t.integer "salary"
>>>>>>> doraemon/master
    t.string "password_digest"
    t.string "frame"
    t.string "lang"
    t.string "adoption"
    t.text "appeal"
    t.string "system"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

<<<<<<< HEAD
  create_table "company_offers", force: :cascade do |t|
    t.integer "com_id"
    t.integer "mem_id"
    t.date "senddate"
    t.boolean "acc_flag"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "mem_name", limit: 20, null: false
    t.string "user_name", limit: 10, null: false
    t.string "mem_info", limit: 30, null: false
    t.string "mem_birth", null: false
    t.string "mem_gra", null: false
    t.string "des_occupation", limit: 100, null: false
    t.string "des_location", limit: 50, null: false
    t.string "password_digest", null: false
    t.string "pic"
    t.string "univercity", limit: 20
    t.string "circle"
    t.string "labo"
    t.string "study", limit: 100
    t.string "deliver", limit: 10
    t.string "activity", limit: 50
    t.string "qualification"
    t.string "lang_ex"
    t.string "system_ex", limit: 50
    t.string "flame_ex", limit: 50
=======
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
>>>>>>> doraemon/master
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
