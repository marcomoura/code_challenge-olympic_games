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

ActiveRecord::Schema.define(version: 20160628154336) do

  create_table "athletes", force: :cascade do |t|
    t.string   "name",           limit: 50, null: false
    t.string   "code",           limit: 50, null: false
    t.integer  "competition_id",            null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "athletes", ["competition_id"], name: "index_athletes_on_competition_id"

  create_table "competitions", force: :cascade do |t|
    t.integer  "status",     default: 0, null: false
    t.string   "sport_name",             null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "competitions", ["sport_name"], name: "index_competitions_on_sport_name"

  create_table "results", force: :cascade do |t|
    t.string   "athlete_code",             null: false
    t.integer  "score",        default: 0, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "results", ["athlete_code"], name: "index_results_on_athlete_code"

  create_table "sports", force: :cascade do |t|
    t.string   "name",                limit: 50,             null: false
    t.integer  "comparison_operator",            default: 0, null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "sports", ["name"], name: "index_sports_on_name"

end
