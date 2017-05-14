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

ActiveRecord::Schema.define(version: 20170514185054) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "careers", force: :cascade do |t|
    t.string   "namecareer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string   "title"
    t.text     "abstract"
    t.string   "namestudent"
    t.string   "nameprofessor"
    t.string   "lastnameprofessor"
    t.date     "datepublished"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "user_id"
    t.integer  "career_id"
    t.integer  "school_id"
    t.string   "lastnamestudent"
    t.index ["career_id"], name: "index_documents_on_career_id", using: :btree
    t.index ["school_id"], name: "index_documents_on_school_id", using: :btree
    t.index ["user_id"], name: "index_documents_on_user_id", using: :btree
  end

  create_table "documents_tags", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "document_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["document_id"], name: "index_documents_tags_on_document_id", using: :btree
    t.index ["tag_id"], name: "index_documents_tags_on_tag_id", using: :btree
  end

  create_table "schools", force: :cascade do |t|
    t.string   "nameschool"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "lastname"
    t.integer  "rut"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "documents", "careers"
  add_foreign_key "documents", "schools"
  add_foreign_key "documents", "users"
  add_foreign_key "documents_tags", "documents"
  add_foreign_key "documents_tags", "tags"
end
