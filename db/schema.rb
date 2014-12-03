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

ActiveRecord::Schema.define(version: 20141203194222) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.integer  "listing_id"
    t.text     "url",                         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "shop_id"
    t.boolean  "main_img",    default: false
    t.boolean  "shop_banner", default: false
  end

  add_index "images", ["listing_id"], name: "index_images_on_listing_id", using: :btree
  add_index "images", ["shop_id"], name: "index_images_on_shop_id", using: :btree
  add_index "images", ["user_id"], name: "index_images_on_user_id", using: :btree

  create_table "listings", force: true do |t|
    t.string   "name",        null: false
    t.integer  "price",       null: false
    t.integer  "available",   null: false
    t.integer  "shop_id",     null: false
    t.text     "description", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "cart_id",                null: false
    t.integer  "listing_id",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "amount",     default: 1
  end

  create_table "reviews", force: true do |t|
    t.text     "content",    null: false
    t.integer  "stars",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_name",  null: false
    t.integer  "user_id",    null: false
    t.integer  "listing_id", null: false
  end

  create_table "shops", force: true do |t|
    t.integer  "user_id",                                                             null: false
    t.string   "name",                                                                null: false
    t.text     "description",                                                         null: false
    t.text     "policies",                                                            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location",    default: "This shop has chosen to hide their location"
  end

  create_table "taggings", force: true do |t|
    t.string   "name"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tag_id",        null: false
  end

  create_table "tags", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",                                                   null: false
    t.string   "password_digest",                                            null: false
    t.string   "session_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location",        default: "User has hidden their location"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
