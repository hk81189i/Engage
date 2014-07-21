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

ActiveRecord::Schema.define(version: 20140421152209) do

  create_table "admins", force: true do |t|
    t.integer  "infu_id",                             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "infu_owner_id"
    t.string   "admin_name"
    t.boolean  "approved"
    t.string   "confirmation_token",                  null: false
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at",                null: false
    t.string   "unconfirmed_email"
  end

  add_index "admins", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "batches", force: true do |t|
    t.date    "date"
    t.string  "name"
    t.date    "created_at"
    t.date    "updated_at"
    t.integer "product_id"
  end

  create_table "bds", force: true do |t|
    t.string "name",       limit: 9
    t.date   "created_at"
    t.date   "updated_at"
  end

  create_table "collections", force: true do |t|
    t.date    "date"
    t.integer "amount"
    t.integer "contact_id"
    t.integer "sale_id"
    t.string  "created_at",       limit: 19
    t.string  "updated_at",       limit: 19
    t.integer "invoice_id"
    t.integer "invoicing_status"
    t.string  "mode",             limit: 24
    t.string  "payment_details",  limit: 94
    t.string  "comments"
  end

  create_table "contacts", force: true do |t|
    t.string  "name",       limit: 31
    t.string  "email"
    t.string  "phone"
    t.integer "admin_id"
    t.date    "created_at"
    t.date    "updated_at"
    t.string  "fname"
    t.string  "lname"
    t.string  "infu_id"
    t.integer "bd_id"
  end

  create_table "contacts123", force: true do |t|
    t.string  "name",       limit: 31
    t.string  "email"
    t.string  "phone"
    t.integer "admin_id"
    t.date    "created_at"
    t.date    "updated_at"
    t.string  "fname"
    t.string  "lname"
    t.string  "infu_id"
    t.integer "bd_id"
  end

  create_table "contactvalues", force: true do |t|
    t.integer  "contact_id"
    t.string   "customftype"
    t.string   "customf"
    t.string   "data",            limit: 16000
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "internalform_id"
    t.integer  "required"
  end

  create_table "countries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customfs", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customftypes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dashboards", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dropboxes", force: true do |t|
    t.integer  "internalformfeild_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dropboxfeilds", force: true do |t|
    t.string   "options"
    t.integer  "dropbox_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "internalformfeild_id"
  end

  create_table "externalformlinks", force: true do |t|
    t.integer  "contact_id"
    t.string   "link"
    t.integer  "form_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "string"
  end

  create_table "histories", force: true do |t|
    t.string   "name"
    t.string   "lead"
    t.string   "owner"
    t.string   "detail"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
  end

  create_table "internalformfeilds", force: true do |t|
    t.string   "internalform_id"
    t.integer  "customftype_id"
    t.text     "cfeild",          limit: 2147483647
    t.integer  "required"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sort",                               default: 2
    t.string   "helptext"
  end

  create_table "internalforms", force: true do |t|
    t.string   "name"
    t.string   "internalform_feild_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "goal"
    t.text     "formtype"
    t.text     "campaign"
  end

  create_table "invoices", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "contact_id"
    t.integer  "sale_id"
    t.integer  "amount_collected"
    t.integer  "amount_pplan"
    t.integer  "collection_current"
    t.integer  "approve"
    t.integer  "invoice_sent"
  end

  create_table "lead_statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leads", force: true do |t|
    t.integer "infu_id"
    t.string  "name",           limit: 36
    t.string  "fname",          limit: 31
    t.string  "lname",          limit: 19
    t.string  "email",          limit: 37
    t.date    "date",                      default: '2014-02-02', null: false
    t.integer "infu_owner_id"
    t.string  "owner",          limit: 16
    t.integer "reassigned"
    t.string  "gacontent",      limit: 52
    t.string  "gasource",       limit: 36
    t.string  "gamedium",       limit: 10
    t.string  "gaterm",         limit: 69
    t.string  "gacampaign",     limit: 39
    t.string  "pcity",          limit: 25
    t.integer "lead_status_id"
  end

  add_index "leads", ["id"], name: "id", unique: true, using: :btree

  create_table "oncourse_exercises", force: true do |t|
    t.string   "prac_name"
    t.string   "change_agent"
    t.string   "precondition"
    t.string   "technique"
    t.string   "postcondition"
    t.string   "tti_date"
    t.string   "test"
    t.string   "futurepacing"
    t.string   "coach_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "owners", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pconfirms", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "topthreedreams"
    t.string   "topthreethings"
    t.string   "transformations"
  end

  create_table "posts", force: true do |t|
    t.string   "name"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pplans", force: true do |t|
    t.date     "paying_date"
    t.integer  "amount"
    t.integer  "contact_id"
    t.integer  "sale_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "selling_price"
    t.string   "token",            limit: 10
    t.date     "saledate"
    t.integer  "batch_id"
    t.string   "invoice_id",       limit: 10
    t.string   "approve"
    t.integer  "payment_complete"
  end

  create_table "products", force: true do |t|
    t.string "name"
    t.string "created_at", limit: 14
    t.string "updated_at", limit: 14
  end

  create_table "sales", force: true do |t|
    t.integer  "contact_id"
    t.integer  "product_id"
    t.integer  "batch_id"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "selling_price"
    t.datetime "saledate"
    t.datetime "leaddate"
    t.date     "batchdate"
    t.string   "infu_id",            limit: 10
    t.string   "infu_batch"
    t.string   "fname"
    t.string   "lname"
    t.string   "email"
    t.string   "infu_owner_email"
    t.string   "infu_owner_name"
    t.string   "infu_owner_id",      limit: 10
    t.string   "referal_id",         limit: 10
    t.string   "phone",              limit: 22
    t.string   "referal_code",       limit: 10
    t.string   "consessions",        limit: 8
    t.string   "duplicate",          limit: 3
    t.text     "comments"
    t.integer  "approve"
    t.integer  "payment_complete"
    t.integer  "sent_first_invoice"
    t.string   "sponsor_email"
    t.integer  "cycle"
  end

  create_table "states", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tempfixes", force: true do |t|
    t.string   "infu_owner_id"
    t.string   "infu_id"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "temps", force: true do |t|
    t.date     "date"
    t.integer  "amount"
    t.integer  "pplan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "estimate"
  end

end
