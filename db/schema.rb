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

ActiveRecord::Schema.define(version: 20170621214520) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "careers", force: :cascade do |t|
    t.string   "namecareer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "codigo"
  end

  create_table "documents", force: :cascade do |t|
    t.string   "title"
    t.text     "abstract"
    t.date     "datepublished"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "attachment"
    t.integer  "user_id"
    t.integer  "professor_id"
    t.integer  "student_id"
    t.string   "rut_student"
    t.string   "rut_professor"
  end

  create_table "documents_tags", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "document_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["document_id"], name: "index_documents_tags_on_document_id", using: :btree
    t.index ["tag_id"], name: "index_documents_tags_on_tag_id", using: :btree
  end

  create_table "professors", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "email"
    t.string   "rut"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string   "nameschool"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "rut"
    t.string   "email"
    t.integer  "career_id"
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "documents", "professors"
  add_foreign_key "documents", "students"
  add_foreign_key "documents", "users"
  add_foreign_key "documents_tags", "documents"
  add_foreign_key "documents_tags", "tags"
  add_foreign_key "students", "careers"
end
