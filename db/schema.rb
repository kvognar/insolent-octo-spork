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

ActiveRecord::Schema.define(version: 20150924210340) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "link"
  end

  create_table "comics", force: :cascade do |t|
    t.string  "name"
    t.string  "link"
    t.string  "default_description"
    t.integer "artist_id"
  end

  add_index "comics", ["artist_id"], name: "index_comics_on_artist_id", using: :btree
  add_index "comics", ["name", "artist_id"], name: "index_comics_on_name_and_artist_id", unique: true, using: :btree

  create_table "thumbnails", force: :cascade do |t|
    t.integer "comic_id"
  end

  add_index "thumbnails", ["comic_id"], name: "index_thumbnails_on_comic_id", using: :btree

  add_foreign_key "comics", "artists"
  add_foreign_key "thumbnails", "comics"
end