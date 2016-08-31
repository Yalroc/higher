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

ActiveRecord::Schema.define(version: 20160831002016) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidates", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_candidates_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_candidates_on_reset_password_token", unique: true, using: :btree
  end

  create_table "educations", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "title"
    t.text     "description"
    t.boolean  "present"
    t.string   "degree_type"
    t.string   "degree_field"
    t.string   "organization"
    t.integer  "job_application_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["job_application_id"], name: "index_educations_on_job_application_id", using: :btree
  end

  create_table "experiences", force: :cascade do |t|
    t.integer  "company_size"
    t.string   "industry"
    t.string   "organization"
    t.integer  "job_application_id"
    t.string   "title"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "description"
    t.boolean  "present"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["job_application_id"], name: "index_experiences_on_job_application_id", using: :btree
  end

  create_table "job_applications", force: :cascade do |t|
    t.integer  "candidate_id"
    t.integer  "job_offer_id"
    t.text     "motivation_letter"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.boolean  "submit"
    t.boolean  "contact"
    t.boolean  "rejected"
    t.boolean  "viewed"
    t.index ["candidate_id"], name: "index_job_applications_on_candidate_id", using: :btree
    t.index ["job_offer_id"], name: "index_job_applications_on_job_offer_id", using: :btree
  end

  create_table "job_offers", force: :cascade do |t|
    t.integer  "recruiter_id"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "title"
    t.string   "location"
    t.decimal  "min_xp"
    t.decimal  "max_xp"
    t.integer  "salary"
    t.index ["recruiter_id"], name: "index_job_offers_on_recruiter_id", using: :btree
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.string   "proficiency"
    t.integer  "job_application_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["job_application_id"], name: "index_languages_on_job_application_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "job_application_id"
    t.string   "author_role"
    t.text     "content"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["job_application_id"], name: "index_messages_on_job_application_id", using: :btree
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.integer  "size"
    t.string   "industry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "photo_url"
  end

  create_table "recruiters", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "title"
    t.integer  "organization_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_recruiters_on_email", unique: true, using: :btree
    t.index ["organization_id"], name: "index_recruiters_on_organization_id", using: :btree
    t.index ["reset_password_token"], name: "index_recruiters_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "educations", "job_applications"
  add_foreign_key "experiences", "job_applications"
  add_foreign_key "languages", "job_applications"
  add_foreign_key "messages", "job_applications"
  add_foreign_key "recruiters", "organizations"
end
