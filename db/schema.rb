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

ActiveRecord::Schema.define(version: 20150817110918) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "requests", force: :cascade do |t|
    t.string   "customer_name"
    t.string   "customer_email"
    t.string   "customer_phone"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "comments"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "site_id"
  end

  add_index "requests", ["site_id"], name: "index_requests_on_site_id", using: :btree

  create_table "searches", force: :cascade do |t|
    t.string   "town"
    t.string   "accommodation_type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "sites", force: :cascade do |t|
    t.string   "name"
    t.string   "town"
    t.string   "postcode"
    t.text     "description"
    t.integer  "price"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "vendor_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "summary"
    t.string   "accommodation_type"
    t.integer  "occupancy"
    t.string   "street"
    t.string   "county"
    t.string   "available_from"
    t.string   "available_to"
    t.boolean  "toilet_block",             default: false
    t.boolean  "ensuite_toilet",           default: false
    t.boolean  "shower_block",             default: false
    t.boolean  "ensuite_shower",           default: false
    t.boolean  "on-site_restaurant",       default: false
    t.boolean  "on-site_shop",             default: false
    t.boolean  "cooking_facilities",       default: false
    t.boolean  "charging_facilities",      default: false
    t.boolean  "on-site parking",          default: false
    t.boolean  "handicap_accessible",      default: false
    t.boolean  "wifi_available",           default: false
    t.boolean  "pets_welcome",             default: false
    t.boolean  "family_friendly",          default: false
    t.boolean  "no_children",              default: false
    t.boolean  "supermarket_nearby",       default: false
    t.boolean  "eco_friendly",             default: false
    t.boolean  "campfires_allowed",        default: false
    t.boolean  "barbecues_allowed",        default: false
    t.boolean  "towels_provided",          default: false
    t.boolean  "laundry_facilities",       default: false
    t.boolean  "forest",                   default: false
    t.boolean  "lake",                     default: false
    t.boolean  "mountain",                 default: false
    t.boolean  "peaceful",                 default: false
    t.boolean  "remote_location",          default: false
    t.boolean  "scenic",                   default: false
    t.boolean  "good_for_hiking",          default: false
    t.boolean  "wildlife_haven",           default: false
    t.boolean  "canoeing_nearby",          default: false
    t.boolean  "climbing_nearby",          default: false
    t.boolean  "beach_nearby",             default: false
    t.boolean  "cycle_hire_nearby",        default: false
    t.boolean  "horse_riding_nearby",      default: false
    t.boolean  "sailing_nearby",           default: false
    t.boolean  "watersports_nearby",       default: false
    t.boolean  "pub_or_restaurant_nearby", default: false
    t.string   "image_2_file_name"
    t.string   "image_2_content_type"
    t.integer  "image_2_file_size"
    t.datetime "image_2_updated_at"
    t.string   "image_3_file_name"
    t.string   "image_3_content_type"
    t.integer  "image_3_file_size"
    t.datetime "image_3_updated_at"
    t.string   "image_4_file_name"
    t.string   "image_4_content_type"
    t.integer  "image_4_file_size"
    t.datetime "image_4_updated_at"
    t.string   "image_5_file_name"
    t.string   "image_5_content_type"
    t.integer  "image_5_file_size"
    t.datetime "image_5_updated_at"
    t.string   "image_6_file_name"
    t.string   "image_6_content_type"
    t.integer  "image_6_file_size"
    t.datetime "image_6_updated_at"
  end

  add_index "sites", ["vendor_id"], name: "index_sites_on_vendor_id", using: :btree

  create_table "vendors", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "vendors", ["email"], name: "index_vendors_on_email", unique: true, using: :btree
  add_index "vendors", ["reset_password_token"], name: "index_vendors_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "requests", "sites"
  add_foreign_key "sites", "vendors"
end
