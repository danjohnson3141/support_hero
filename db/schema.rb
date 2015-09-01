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

ActiveRecord::Schema.define(version: 20150901223238) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hero_schedules", force: :cascade do |t|
    t.date     "scheduled_on"
    t.integer  "hero_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "hero_schedules", ["created_by"], name: "index_hero_schedules_on_created_by", using: :btree
  add_index "hero_schedules", ["hero_id", "scheduled_on"], name: "index_hero_schedules_on_hero_id_and_scheduled_on", using: :btree
  add_index "hero_schedules", ["hero_id"], name: "index_hero_schedules_on_hero_id", using: :btree
  add_index "hero_schedules", ["updated_by"], name: "index_hero_schedules_on_updated_by", using: :btree

  create_table "heroes", force: :cascade do |t|
    t.string   "first_name", limit: 100, null: false
    t.string   "last_name",  limit: 100
    t.string   "title"
    t.text     "bio"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "heroes", ["created_by"], name: "index_heroes_on_created_by", using: :btree
  add_index "heroes", ["updated_by"], name: "index_heroes_on_updated_by", using: :btree

  create_table "holidays", force: :cascade do |t|
    t.date     "holiday_date",             null: false
    t.string   "name",         limit: 100
    t.text     "description"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "holidays", ["created_by"], name: "index_holidays_on_created_by", using: :btree
  add_index "holidays", ["holiday_date"], name: "index_holidays_on_holiday_date", unique: true, using: :btree
  add_index "holidays", ["updated_by"], name: "index_holidays_on_updated_by", using: :btree

  add_foreign_key "hero_schedules", "heroes"
end
