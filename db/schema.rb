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

ActiveRecord::Schema.define(version: 20151029110130) do

  create_table "admins", force: true do |t|
    t.string   "email",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree

  create_table "amazondata", force: true do |t|
    t.text     "name_AMA"
    t.integer  "newprice_AMA"
    t.integer  "usedprice_AMA"
    t.integer  "newnumber_AMA"
    t.integer  "usenumber_AMA"
    t.integer  "newitem_AMA"
    t.integer  "olditem_AMA"
    t.string   "maker_AMA"
    t.integer  "isbn_AMA"
    t.string   "asin_AMA"
    t.text     "img_AMA"
    t.text     "afilink_AMA"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rakutendata", force: true do |t|
    t.string   "name_RAKU"
    t.integer  "price_RAKU"
    t.boolean  "newitem_RAKU"
    t.string   "maker_RAKU"
    t.text     "desc_RAKU"
    t.string   "itemcode_RAKU"
    t.text     "img_RAKU"
    t.text     "afilink_RAKU"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
