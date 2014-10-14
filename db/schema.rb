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

ActiveRecord::Schema.define(version: 20141014133835) do

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

  create_table "leagues", force: true do |t|
    t.integer  "account_id"
    t.string   "title"
    t.text     "description"
    t.string   "league_url"
    t.json     "league_data"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "leagues", ["account_id"], name: "index_leagues_on_account_id", using: :btree

  create_table "pairings", force: true do |t|
    t.integer  "rounds_id"
    t.integer  "participant_1_id"
    t.integer  "participant_2_id"
    t.string   "result"
    t.json     "participant_1_data"
    t.json     "participant_2_data"
    t.json     "pairing_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pairings", ["participant_1_id"], name: "index_pairings_on_participant_1_id", using: :btree
  add_index "pairings", ["participant_2_id"], name: "index_pairings_on_participant_2_id", using: :btree

  create_table "participants", force: true do |t|
    t.integer  "tournament_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.json     "participant_data"
  end

  add_index "participants", ["tournament_id"], name: "index_participants_on_tournament_id", using: :btree

  create_table "rounds", force: true do |t|
    t.integer  "stages_id"
    t.datetime "round_start_override"
    t.datetime "round_end_override"
    t.boolean  "has_started",          default: false, null: false
    t.boolean  "has_ended",            default: false, null: false
    t.json     "round_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rounds", ["stages_id"], name: "index_rounds_on_stages_id", using: :btree

  create_table "stages", force: true do |t|
    t.integer  "tournaments_id"
    t.datetime "stage_start"
    t.datetime "stage_end"
    t.datetime "doors_open_time"
    t.integer  "number_of_rounds"
    t.integer  "minutes_per_round"
    t.string   "type"
    t.json     "stage_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stages", ["tournaments_id"], name: "index_stages_on_tournaments_id", using: :btree

  create_table "tournaments", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "show_key"
    t.string   "admin_key"
    t.datetime "tournament_start"
    t.datetime "tournament_end"
    t.string   "signup_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
    t.datetime "doors_open_time"
    t.json     "tournament_data"
    t.string   "type"
  end

  add_index "tournaments", ["account_id"], name: "index_tournaments_on_account_id", using: :btree

end
