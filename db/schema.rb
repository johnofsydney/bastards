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

ActiveRecord::Schema[7.0].define(version: 2022_04_12_014430) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidates", force: :cascade do |t|
    t.bigint "party_id", null: false
    t.bigint "religion_id"
    t.string "name"
    t.date "dob"
    t.date "first_elected"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "electorate_id", null: false
    t.string "state"
    t.bigint "faction_id"
    t.bigint "union_id"
    t.boolean "potential_winner"
    t.bigint "qualification_level_id"
    t.bigint "field_of_study_id"
    t.bigint "profession_id"
    t.index ["electorate_id"], name: "index_candidates_on_electorate_id"
    t.index ["faction_id"], name: "index_candidates_on_faction_id"
    t.index ["field_of_study_id"], name: "index_candidates_on_field_of_study_id"
    t.index ["party_id"], name: "index_candidates_on_party_id"
    t.index ["profession_id"], name: "index_candidates_on_profession_id"
    t.index ["qualification_level_id"], name: "index_candidates_on_qualification_level_id"
    t.index ["religion_id"], name: "index_candidates_on_religion_id"
    t.index ["union_id"], name: "index_candidates_on_union_id"
  end

  create_table "electorates", force: :cascade do |t|
    t.string "name"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "factions", force: :cascade do |t|
    t.string "name"
    t.bigint "party_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["party_id"], name: "index_factions_on_party_id"
  end

  create_table "field_of_studies", force: :cascade do |t|
    t.string "field"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable"
  end

  create_table "professions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qualification_levels", force: :cascade do |t|
    t.string "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "religions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "candidates", "electorates"
  add_foreign_key "candidates", "factions"
  add_foreign_key "candidates", "field_of_studies"
  add_foreign_key "candidates", "parties"
  add_foreign_key "candidates", "professions"
  add_foreign_key "candidates", "qualification_levels"
  add_foreign_key "candidates", "religions"
  add_foreign_key "candidates", "unions"
  add_foreign_key "factions", "parties"
end
