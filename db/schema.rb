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

ActiveRecord::Schema.define(version: 20160509102946) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "downloads", force: :cascade do |t|
    t.integer  "rubygem_id",             null: false
    t.integer  "count",      default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["rubygem_id"], name: "index_downloads_on_rubygem_id", using: :btree
  end

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
    t.index ["name"], name: "index_rubygems_on_name", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "github_uid"
    t.string   "github_name"
    t.boolean  "admin",       default: false, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
