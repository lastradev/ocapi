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

ActiveRecord::Schema[8.0].define(version: 2024_05_25_211223) do
  create_table "crimes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "year"
    t.integer "state_id"
    t.string "state"
    t.integer "city_id"
    t.string "city"
    t.string "affected_legal_asset"
    t.string "crime_type"
    t.string "crime_subtype"
    t.string "modality"
    t.integer "january_count"
    t.integer "february_count"
    t.integer "march_count"
    t.integer "april_count"
    t.integer "may_count"
    t.integer "june_count"
    t.integer "july_count"
    t.integer "august_count"
    t.integer "september_count"
    t.integer "october_count"
    t.integer "november_count"
    t.integer "december_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
