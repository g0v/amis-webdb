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

ActiveRecord::Schema.define(version: 2021_04_30_022758) do

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

  create_table "version_associations", force: :cascade do |t|
    t.integer "version_id"
    t.string "foreign_key_name", null: false
    t.integer "foreign_key_id"
    t.string "foreign_type"
    t.index ["foreign_key_name", "foreign_key_id", "foreign_type"], name: "index_version_associations_on_foreign_key"
    t.index ["version_id"], name: "index_version_associations_on_version_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.bigint "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object", limit: 1073741823
    t.datetime "created_at"
    t.text "object_changes", limit: 1073741823
    t.integer "transaction_id"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
    t.index ["transaction_id"], name: "index_versions_on_transaction_id"
  end

end
