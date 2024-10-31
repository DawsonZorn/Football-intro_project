# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_10_28_230932) do
  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.integer "season_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["season_id"], name: "index_leagues_on_season_id"
  end

  create_table "matches", force: :cascade do |t|
    t.string "round"
    t.date "date"
    t.string "time"
    t.integer "team1_id", null: false
    t.integer "team2_id", null: false
    t.integer "league_id", null: false
    t.integer "season_id", null: false
    t.integer "ht_team1"
    t.integer "ht_team2"
    t.integer "ft_team1"
    t.integer "ft_team2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_matches_on_league_id"
    t.index ["season_id"], name: "index_matches_on_season_id"
    t.index ["team1_id"], name: "index_matches_on_team1_id"
    t.index ["team2_id"], name: "index_matches_on_team2_id"
  end

  create_table "seasons", force: :cascade do |t|
    t.string "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "league_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["league_id"], name: "index_teams_on_league_id"
  end

  add_foreign_key "leagues", "seasons"
  add_foreign_key "matches", "leagues"
  add_foreign_key "matches", "seasons"
  add_foreign_key "matches", "team1s"
  add_foreign_key "matches", "team2s"
  add_foreign_key "teams", "leagues"
end
