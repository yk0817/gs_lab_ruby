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

ActiveRecord::Schema.define(version: 2018_08_12_070547) do

  create_table "articles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "contents"
    t.bigint "headline_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["headline_id"], name: "index_articles_on_headline_id"
  end

  create_table "headlines", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "title"
    t.string "label"
    t.bigint "school_blog_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_blog_id"], name: "index_headlines_on_school_blog_id"
  end

  create_table "school_blogs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "url"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "articles", "headlines"
  add_foreign_key "headlines", "school_blogs"
end
