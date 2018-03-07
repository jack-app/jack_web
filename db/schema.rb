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

ActiveRecord::Schema.define(version: 20180307084729) do

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "genre"
    t.string "place"
    t.text "describe"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "member_products", force: :cascade do |t|
    t.integer "member_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_member_products_on_member_id"
    t.index ["product_id"], name: "index_member_products_on_product_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "university"
    t.string "password_digest"
    t.date "enroll"
    t.boolean "leader", default: false
    t.text "profile"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_links", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "genre"
    t.integer "price"
    t.date "start_at"
    t.date "end_at"
    t.text "describe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slogan"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.date "start_at"
    t.integer "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sns_links", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.integer "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
