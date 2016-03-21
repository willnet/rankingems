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

ActiveRecord::Schema.define(version: 20160321080141) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.integer  "user_id",                   null: false
    t.integer  "status",        default: 0, null: false
    t.integer  "visible_scope", default: 0, null: false
    t.string   "title",                     null: false
    t.text     "body",                      null: false
    t.date     "expired_on",                null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "boards", ["deleted_at", "expired_on"], name: "index_boards_on_deleted_at_and_expired_on", using: :btree
  add_index "boards", ["deleted_at", "status", "visible_scope", "user_id"], name: "boards_index", using: :btree

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "message",    null: false
    t.string   "referer"
    t.string   "ip"
    t.string   "user_agent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feedbacks", ["user_id"], name: "index_feedbacks_on_user_id", using: :btree

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "friend_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friendships", ["user_id", "friend_id"], name: "index_friendships_on_user_id_and_friend_id", unique: true, using: :btree

  create_table "invitations", force: :cascade do |t|
    t.string   "email",       null: false
    t.string   "token",       null: false
    t.integer  "sender_id",   null: false
    t.integer  "receiver_id"
    t.datetime "joined_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "invitations", ["receiver_id"], name: "index_invitations_on_receiver_id", using: :btree
  add_index "invitations", ["sender_id"], name: "index_invitations_on_sender_id", using: :btree
  add_index "invitations", ["token"], name: "index_invitations_on_token", unique: true, using: :btree

  create_table "messages", force: :cascade do |t|
    t.integer  "sender_id",                   null: false
    t.integer  "receiver_id",                 null: false
    t.text     "body",                        null: false
    t.integer  "status",      default: 0,     null: false
    t.boolean  "notified",    default: false, null: false
    t.string   "room_code",                   null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "messages", ["room_code"], name: "index_messages_on_room_code", using: :btree

  create_table "notifications", force: :cascade do |t|
    t.integer  "status",               default: 0, null: false
    t.integer  "sender_id"
    t.integer  "receiver_id",                      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "notification_type",    default: 0
    t.integer  "target_user_id"
    t.integer  "target_resource_id"
    t.string   "target_resource_type"
  end

  add_index "notifications", ["receiver_id", "status", "sender_id"], name: "index_notifications_on_receiver_id_and_status_and_sender_id", using: :btree
  add_index "notifications", ["sender_id", "status"], name: "index_notifications_on_sender_id_and_status", using: :btree

  create_table "offers", force: :cascade do |t|
    t.integer  "sender_id",               null: false
    t.integer  "receiver_id",             null: false
    t.datetime "achieved_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.datetime "rejected_at"
    t.integer  "status",      default: 0, null: false
  end

  add_index "offers", ["receiver_id", "achieved_at"], name: "index_offers_on_receiver_id_and_achieved_at", using: :btree
  add_index "offers", ["sender_id", "achieved_at"], name: "index_offers_on_sender_id_and_achieved_at", using: :btree

  create_table "rubygems", force: :cascade do |t|
    t.string   "name",                           null: false
    t.string   "version",                        null: false
    t.string   "authors"
    t.string   "project_uri"
    t.string   "gem_uri"
    t.string   "homepage_uri"
    t.string   "wiki_uri"
    t.string   "documentation_uri"
    t.string   "mailing_list_uri"
    t.string   "source_code_uri"
    t.string   "bug_tracker_uri"
    t.text     "licenses",          default: [],              array: true
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "rubygems", ["name"], name: "index_rubygems_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                                       null: false
    t.string   "twitter_uid"
    t.string   "twitter_name"
    t.string   "facebook_uid"
    t.string   "facebook_name"
    t.string   "github_uid"
    t.string   "github_name"
    t.integer  "status",                       default: 0,    null: false
    t.integer  "occupation"
    t.boolean  "more_work"
    t.integer  "work_day_per_week"
    t.text     "condition"
    t.date     "transfer_on"
    t.text     "profile"
    t.boolean  "receive_notification",         default: true, null: false
    t.datetime "profile_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "facebook_url"
    t.integer  "max_invitation_number",        default: 0,    null: false
    t.text     "wish"
    t.string   "name"
    t.boolean  "receive_message_notification", default: true, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["name"], name: "index_users_on_name", unique: true, using: :btree

  add_foreign_key "boards", "users"
end
