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

ActiveRecord::Schema.define(version: 2021_04_30_020349) do

  create_table "definitions", force: :cascade do |t|
    t.integer "term_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["term_id"], name: "index_definitions_on_term_id"
  end

  create_table "descriptions", force: :cascade do |t|
    t.integer "definition_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "term_id"
    t.index ["definition_id"], name: "index_descriptions_on_definition_id"
    t.index ["term_id"], name: "index_descriptions_on_term_id"
  end

  create_table "examples", force: :cascade do |t|
    t.integer "description_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "linked_content", limit: 500
    t.index ["description_id"], name: "index_examples_on_description_id"
  end

  create_table "raw_contents", force: :cascade do |t|
    t.string "key"
    t.string "value"
    t.integer "term_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "loanword", default: false
    t.index ["key"], name: "index_raw_contents_on_key"
    t.index ["loanword"], name: "index_raw_contents_on_loanword"
    t.index ["term_id"], name: "index_raw_contents_on_term_id"
  end

  create_table "stems", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_stems_on_name"
  end

  create_table "synonyms", force: :cascade do |t|
    t.integer "description_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "term_type", limit: 5
    t.string "linked_content"
    t.index ["description_id"], name: "index_synonyms_on_description_id"
  end

  create_table "terms", force: :cascade do |t|
    t.string "name"
    t.integer "stem_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "repetition"
    t.string "lower_name"
    t.boolean "loanword", default: false
    t.index ["loanword"], name: "index_terms_on_loanword"
    t.index ["lower_name"], name: "index_terms_on_lower_name"
    t.index ["name"], name: "index_terms_on_name"
    t.index ["stem_id"], name: "index_terms_on_stem_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
