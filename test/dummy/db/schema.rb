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

ActiveRecord::Schema.define(version: 20140607225455) do

  create_table "bills", force: true do |t|
    t.integer  "project_id"
    t.integer  "supplier_id"
    t.datetime "date_due"
    t.decimal  "vat",          precision: 10, scale: 0
    t.decimal  "total",        precision: 10, scale: 0
    t.string   "supplier_ref"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "postcode"
    t.string   "tel"
    t.string   "email"
    t.string   "reg_no"
    t.string   "vat_no"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "companies", ["name"], name: "index_companies_on_name", unique: true, using: :btree

  create_table "customers", force: true do |t|
    t.string   "first_name"
    t.string   "surname"
    t.string   "company_name"
    t.string   "address"
    t.string   "postcode"
    t.integer  "tel"
    t.integer  "mob"
    t.string   "email"
    t.integer  "vat_no"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expcats", force: true do |t|
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expenses", force: true do |t|
    t.integer  "user_id"
    t.datetime "date"
    t.integer  "project_id"
    t.integer  "expcat_id"
    t.string   "name"
    t.string   "ref"
    t.decimal  "total",      precision: 10, scale: 2
    t.integer  "vat_no"
    t.integer  "reciept"
    t.decimal  "price",      precision: 10, scale: 2
    t.decimal  "vat",        precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status"
  end

  create_table "invoicepaids", force: true do |t|
    t.integer  "user_id"
    t.integer  "invoice_id"
    t.integer  "payment_method"
    t.decimal  "sum_paid",       precision: 10, scale: 2
    t.datetime "date_paid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoiceproducts", force: true do |t|
    t.integer  "product_id"
    t.integer  "invoice_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoices", force: true do |t|
    t.integer  "project_id"
    t.datetime "date_issue"
    t.datetime "date_due"
    t.decimal  "vat",        precision: 10, scale: 0
    t.decimal  "total",      precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mileages", force: true do |t|
    t.integer  "user_id"
    t.datetime "date"
    t.integer  "project_id"
    t.string   "start_location"
    t.string   "end_location"
    t.decimal  "mileage",        precision: 3, scale: 0
    t.integer  "return_trip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status"
  end

  create_table "mjweb_details", force: true do |t|
    t.integer  "company_id"
    t.string   "subdomain_name"
    t.string   "tile_colour"    
    t.string   "background"
    t.string   "tagline"
    t.integer  "ecommerce"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "googleplus"
    t.string   "linkedin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjweb_images", force: true do |t|
    t.integer  "company_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.string   "photo_file_size"
    t.string   "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjweb_imagesettings", force: true do |t|
    t.integer  "image_id"
    t.integer  "setting_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjweb_services", force: true do |t|
    t.integer  "company_id"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjweb_contents", force: true do |t|
    t.integer  "company_id"
    t.integer  "tile_id"
    t.integer  "order"
    t.string  "display"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mjweb_tiles", force: true do |t|
    t.string   "name"
    t.string   "partial_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prodcats", force: true do |t|
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.integer  "prodcat_id"
    t.string   "name"
    t.string   "ref"
    t.decimal  "cost",       precision: 10, scale: 2
    t.decimal  "price",      precision: 10, scale: 2
    t.decimal  "vat",        precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "ref"
    t.string   "name"
    t.integer  "customer_id"
    t.string   "customer_ref"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reciepts", force: true do |t|
    t.integer  "invoicepaid_id"
    t.string   "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", force: true do |t|
    t.string   "first_name"
    t.string   "surname"
    t.string   "company_name"
    t.string   "address"
    t.string   "postcode"
    t.integer  "tel"
    t.integer  "mob"
    t.string   "email"
    t.integer  "vat_no"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "surname"
    t.string   "tel"
    t.integer  "company_id"
    t.integer  "role",                   default: 0
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
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["company_id"], name: "index_users_on_company_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

  create_table "websites", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
