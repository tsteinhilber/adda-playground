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

ActiveRecord::Schema.define(version: 20161013154359) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string   "name_first",   limit: 50
    t.string   "name_last",    limit: 50
    t.string   "email",        limit: 75
    t.string   "website",      limit: 100
    t.string   "category",     limit: 50
    t.date     "date_start"
    t.string   "created_user"
    t.string   "updated_user"
    t.string   "old_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "slug",         limit: 110
    t.boolean  "active",                   default: true
    t.index ["name_first"], name: "index_artists_on_name_first", using: :btree
    t.index ["name_last"], name: "index_artists_on_name_last", using: :btree
    t.index ["slug"], name: "index_artists_on_slug", using: :btree
  end

  create_table "artists_teams", id: false, force: :cascade do |t|
    t.integer "artist_id", null: false
    t.integer "team_id",   null: false
    t.index ["artist_id", "team_id"], name: "index_artists_teams_on_artist_id_and_team_id", using: :btree
    t.index ["team_id", "artist_id"], name: "index_artists_teams_on_team_id_and_artist_id", using: :btree
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name",         limit: 100
    t.string   "category",     limit: 50
    t.string   "website",      limit: 100
    t.boolean  "status"
    t.string   "created_user"
    t.string   "updated_user"
    t.string   "old_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "slug",         limit: 110
    t.index ["name"], name: "index_clients_on_name", using: :btree
    t.index ["slug"], name: "index_clients_on_slug", using: :btree
    t.index ["status"], name: "index_clients_on_status", using: :btree
  end

  create_table "companies", force: :cascade do |t|
    t.string   "account_number", limit: 100
    t.string   "name",           limit: 200
    t.string   "name_legal",     limit: 200
    t.string   "old_id",         limit: 100
    t.string   "tax_id",         limit: 100
    t.string   "website",        limit: 200
    t.boolean  "active",                     default: true
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name_first",     limit: 100
    t.string   "name_last",      limit: 100
    t.string   "title",          limit: 100
    t.string   "email",          limit: 100
    t.string   "old_id"
    t.string   "old_parent_id"
    t.string   "old_address_id"
    t.string   "slug",           limit: 200
    t.boolean  "status"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "client_id"
    t.index ["client_id"], name: "index_contacts_on_client_id", using: :btree
    t.index ["name_first"], name: "index_contacts_on_name_first", using: :btree
    t.index ["name_last"], name: "index_contacts_on_name_last", using: :btree
    t.index ["slug"], name: "index_contacts_on_slug", using: :btree
    t.index ["status"], name: "index_contacts_on_status", using: :btree
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "job_number",          limit: 100
    t.string   "name",                limit: 200
    t.boolean  "active",                          default: true
    t.integer  "job_status_id"
    t.integer  "job_type_id"
    t.text     "description"
    t.integer  "job_client_id"
    t.integer  "job_contact_id"
    t.integer  "estimate_client_id"
    t.integer  "estimate_contact_id"
    t.integer  "billing_client_id"
    t.integer  "billing_contact_id"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "category",            limit: 100
    t.index ["active"], name: "index_jobs_on_active", using: :btree
    t.index ["billing_client_id"], name: "index_jobs_on_billing_client_id", using: :btree
    t.index ["billing_contact_id"], name: "index_jobs_on_billing_contact_id", using: :btree
    t.index ["estimate_client_id"], name: "index_jobs_on_estimate_client_id", using: :btree
    t.index ["estimate_contact_id"], name: "index_jobs_on_estimate_contact_id", using: :btree
    t.index ["job_client_id"], name: "index_jobs_on_job_client_id", using: :btree
    t.index ["job_contact_id"], name: "index_jobs_on_job_contact_id", using: :btree
    t.index ["job_number"], name: "index_jobs_on_job_number", using: :btree
    t.index ["job_status_id"], name: "index_jobs_on_job_status_id", using: :btree
    t.index ["job_type_id"], name: "index_jobs_on_job_type_id", using: :btree
  end

  create_table "jobs_teams", id: false, force: :cascade do |t|
    t.integer "job_id",  null: false
    t.integer "team_id", null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.boolean  "lead",       default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["lead"], name: "index_memberships_on_lead", using: :btree
    t.index ["team_id"], name: "index_memberships_on_team_id", using: :btree
    t.index ["user_id"], name: "index_memberships_on_user_id", using: :btree
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "company_id"
    t.index ["company_id"], name: "index_teams_on_company_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                              default: "",    null: false
    t.string   "encrypted_password",                 default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.boolean  "admin",                              default: false
    t.string   "name_first",             limit: 100
    t.string   "name_last",              limit: 100
    t.boolean  "rep"
    t.boolean  "status",                             default: true
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["rep"], name: "index_users_on_rep", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["status"], name: "index_users_on_status", using: :btree
  end

  create_table "value_items", force: :cascade do |t|
    t.integer  "value_list_id"
    t.string   "name",          limit: 200
    t.integer  "position"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["value_list_id"], name: "index_value_items_on_value_list_id", using: :btree
  end

  create_table "value_lists", force: :cascade do |t|
    t.string   "name",              limit: 200
    t.integer  "value_items_count"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "vendors", force: :cascade do |t|
    t.string   "name",       limit: 200
    t.string   "category",   limit: 100
    t.string   "website",    limit: 150
    t.string   "slug",       limit: 200
    t.boolean  "status",                 default: true
    t.string   "old_id",     limit: 100
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["name"], name: "index_vendors_on_name", using: :btree
    t.index ["slug"], name: "index_vendors_on_slug", using: :btree
    t.index ["status"], name: "index_vendors_on_status", using: :btree
  end

  add_foreign_key "contacts", "clients"
  add_foreign_key "memberships", "teams"
  add_foreign_key "memberships", "users"
  add_foreign_key "teams", "companies"
end
