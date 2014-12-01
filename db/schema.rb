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

ActiveRecord::Schema.define(version: 20141201140428) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "adverts", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "categorie"
    t.string   "transaction_type"
    t.integer  "price_cents"
    t.boolean  "published"
    t.boolean  "sold"
    t.integer  "parent_id"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "adverts", ["parent_id"], name: "index_adverts_on_parent_id"
  add_index "adverts", ["school_id"], name: "index_adverts_on_school_id"

  create_table "camps", force: true do |t|
    t.string   "name"
    t.string   "confidential_code"
    t.integer  "level_id"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "year"
  end

  add_index "camps", ["level_id"], name: "index_camps_on_level_id"
  add_index "camps", ["school_id"], name: "index_camps_on_school_id"

  create_table "events", force: true do |t|
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.text     "description"
    t.integer  "school_id"
  end

  add_index "events", ["parent_id"], name: "index_events_on_parent_id"
  add_index "events", ["school_id"], name: "index_events_on_school_id"

  create_table "guests", force: true do |t|
    t.integer  "event_id"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "guests", ["event_id"], name: "index_guests_on_event_id"
  add_index "guests", ["parent_id"], name: "index_guests_on_parent_id"

  create_table "information", force: true do |t|
    t.string   "name"
    t.string   "content"
    t.string   "categorie"
    t.datetime "end_date"
    t.integer  "camp_id"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "information", ["camp_id"], name: "index_information_on_camp_id"
  add_index "information", ["parent_id"], name: "index_information_on_parent_id"

  create_table "kids", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthdate"
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "levels", force: true do |t|
    t.string   "name"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "levels", ["school_id"], name: "index_levels_on_school_id"

  create_table "parents", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.string   "title"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
  end

  add_index "parents", ["email"], name: "index_parents_on_email", unique: true
  add_index "parents", ["reset_password_token"], name: "index_parents_on_reset_password_token", unique: true

  create_table "parentships", force: true do |t|
    t.integer  "kid_id"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  add_index "parentships", ["kid_id"], name: "index_parentships_on_kid_id"
  add_index "parentships", ["parent_id"], name: "index_parentships_on_parent_id"

  create_table "scholarships", force: true do |t|
    t.integer  "camp_id"
    t.integer  "kid_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scholarships", ["camp_id"], name: "index_scholarships_on_camp_id"
  add_index "scholarships", ["kid_id"], name: "index_scholarships_on_kid_id"

  create_table "schools", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "zipcode"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.boolean  "validation"
  end

end
