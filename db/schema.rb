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

ActiveRecord::Schema.define(version: 20141013193730) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["confirmation_token"], name: "index_accounts_on_confirmation_token", unique: true, using: :btree
  add_index "accounts", ["email"], name: "index_accounts_on_email", unique: true, using: :btree
  add_index "accounts", ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true, using: :btree

  create_table "participants", force: true do |t|
    t.integer  "tournament_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "participant_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "participants", ["tournament_id"], name: "index_participants_on_tournament_id", using: :btree

  create_table "tournaments", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "show_key"
    t.string   "admin_key"
    t.datetime "tournament_start"
    t.datetime "tournament_end"
    t.string   "signup_url"
    t.string   "creator_mail"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
  end

  add_index "tournaments", ["account_id"], name: "index_tournaments_on_account_id", using: :btree

end
