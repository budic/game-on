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

ActiveRecord::Schema.define(version: 20130912002755) do

  create_table "event_invites", force: true do |t|
    t.integer  "status_cd"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "event_id"
  end

  add_index "event_invites", ["event_id"], name: "index_event_invites_on_event_id"
  add_index "event_invites", ["user_id"], name: "index_event_invites_on_user_id"

  create_table "events", force: true do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "is_private"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_type_cd"
    t.integer  "location_id"
    t.integer  "game_type_id"
    t.integer  "event_invite_id"
    t.integer  "recurring_event_id"
    t.float    "level"
    t.datetime "next_reminder_time"
    t.integer  "next_reminder_type_cd"
    t.boolean  "private"
  end

  add_index "events", ["event_invite_id"], name: "index_events_on_event_invite_id"
  add_index "events", ["game_type_id"], name: "index_events_on_game_type_id"
  add_index "events", ["location_id"], name: "index_events_on_location_id"
  add_index "events", ["recurring_event_id"], name: "index_events_on_recurring_event_id"

  create_table "game_types", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "locations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "address"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "phone_number"
    t.string   "email"
    t.string   "website"
  end

  create_table "rec_event_follows", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "recurring_event_id"
  end

  add_index "rec_event_follows", ["recurring_event_id"], name: "index_rec_event_follows_on_recurring_event_id"
  add_index "rec_event_follows", ["user_id"], name: "index_rec_event_follows_on_user_id"

  create_table "recurring_events", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id"
    t.integer  "game_type_id"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "day"
    t.float    "level"
    t.datetime "next_gen_date"
  end

  add_index "recurring_events", ["game_type_id"], name: "index_recurring_events_on_game_type_id"
  add_index "recurring_events", ["location_id"], name: "index_recurring_events_on_location_id"

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "user_profiles", force: true do |t|
    t.string   "nickname"
    t.string   "sms_number"
    t.integer  "sms_carrier_cd"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "home_address"
  end

  add_index "user_profiles", ["user_id"], name: "index_user_profiles_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                              default: "", null: false
    t.string   "encrypted_password",     limit: 128, default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "event_invite_id"
    t.integer  "sms_carrier_cd"
    t.integer  "sms_phone"
    t.integer  "user_profile_id"
    t.string   "password_salt"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "invitation_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["event_invite_id"], name: "index_users_on_event_invite_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
