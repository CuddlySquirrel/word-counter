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

ActiveRecord::Schema.define(version: 201504061412141200) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "urls", force: true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "urls_words", id: false, force: true do |t|
    t.integer "url_id"
    t.integer "word_id"
  end

  add_index "urls_words", ["url_id"], name: "index_urls_words_on_url_id", using: :btree
  add_index "urls_words", ["word_id"], name: "index_urls_words_on_word_id", using: :btree

  create_table "words", force: true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end