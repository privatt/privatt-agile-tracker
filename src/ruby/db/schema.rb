# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20120504152649) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "changesets", force: true do |t|
    t.uuid     "story_id"
    t.uuid     "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", force: true do |t|
    t.text     "encrypted_note"
    t.uuid     "user_id"
    t.uuid     "story_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "encrypted_name"
    t.string   "point_scale",         default: "fibonacci"
    t.date     "start_date"
    t.integer  "iteration_start_day", default: 1
    t.integer  "iteration_length",    default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "default_velocity",    default: 10
  end

  create_table "projects_users", id: false, force: true do |t|
    t.uuid "project_id"
    t.uuid "user_id"
  end

  create_table "stories", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "encrypted_title"
    t.text     "encrypted_description"
    t.integer  "estimate"
    t.string   "story_type",            default: "feature"
    t.string   "state",                 default: "unstarted"
    t.date     "accepted_at"
    t.uuid     "requested_by_id"
    t.uuid     "owned_by_id"
    t.uuid     "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "position"
    t.string   "encrypted_labels"
  end

  create_table "users", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.string   "email",                        default: "",   null: false
    t.string   "encrypted_password",           default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "encrypted_current_sign_in_ip"
    t.string   "encrypted_last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_name"
    t.string   "encrypted_initials"
    t.boolean  "email_delivery",               default: true
    t.boolean  "email_acceptance",             default: true
    t.boolean  "email_rejection",              default: true
    t.string   "locale"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
