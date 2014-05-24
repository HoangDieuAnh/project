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

ActiveRecord::Schema.define(version: 20140524211040) do

  create_table "event_pictures", force: true do |t|
    t.integer  "event_id"
    t.binary   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "picturename"
  end

  add_index "event_pictures", ["event_id"], name: "index_event_pictures_on_event_id"

  create_table "events", force: true do |t|
    t.string   "title"
    t.string   "eventType"
    t.date     "eventDate"
    t.time     "eventTime"
    t.string   "venue"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "society_id"
  end

  add_index "events", ["society_id"], name: "index_events_on_society_id"

  create_table "relationships", force: true do |t|
    t.integer  "society_id"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "position"
    t.string   "firstname"
    t.string   "middlename"
    t.string   "lastname"
    t.string   "email"
    t.integer  "phone"
  end

  add_index "relationships", ["society_id"], name: "index_relationships_on_society_id"

  create_table "reservations", force: true do |t|
    t.integer  "ticket_id",  limit: 255
    t.integer  "user_id"
    t.integer  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reservations", ["ticket_id"], name: "index_reservations_on_ticket_id"
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id"

  create_table "societies", force: true do |t|
    t.string   "name"
    t.integer  "regNum"
    t.string   "website"
    t.boolean  "approved"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.text     "description"
  end

  add_index "societies", ["user_id"], name: "index_societies_on_user_id"

  create_table "tickets", force: true do |t|
    t.integer  "price"
    t.integer  "event_id"
    t.date     "startdate"
    t.date     "closedate"
    t.integer  "maxnumber"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tickets", ["event_id"], name: "index_tickets_on_event_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "mobile"
    t.string   "encrypted_password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "salt"
  end

end
