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

ActiveRecord::Schema[7.2].define(version: 2024_10_31_161437) do
  create_table "coaches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "team_id", null: false
    t.index ["team_id"], name: "index_coaches_on_team_id"
  end

  create_table "competitions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "competitions_players", id: false, force: :cascade do |t|
    t.integer "competition_id", null: false
    t.integer "player_id", null: false
  end

  create_table "competitions_teams", id: false, force: :cascade do |t|
    t.integer "team_id", null: false
    t.integer "competition_id", null: false
  end

  create_table "players", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "team_id", null: false
    t.integer "position_id", null: false
    t.string "name"
    t.integer "coach_id", null: false
    t.index ["coach_id"], name: "index_players_on_coach_id"
    t.index ["position_id"], name: "index_players_on_position_id"
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "positions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "teams", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  add_foreign_key "coaches", "teams"
  add_foreign_key "players", "coaches"
  add_foreign_key "players", "positions"
  add_foreign_key "players", "teams"
end
