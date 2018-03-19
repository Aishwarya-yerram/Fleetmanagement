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

ActiveRecord::Schema.define(version: 20180312114632) do

  create_table "customers", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.bigint "phonenum"
    t.string "trucktype_needed"
    t.integer "expected_rent"
    t.integer "numof_trucks"
    t.integer "created_by_id"
    t.string "status", default: "pending"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "buyer_id"
    t.integer "customer_id"
    t.string "cust_trucktype"
    t.integer "vendor_rent"
    t.string "status"
  end

  create_table "users", force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.integer "trucktype"
    t.date "DOB"
    t.text "Gender"
    t.integer "status", default: 0, null: false
  end

  create_table "vendors", force: :cascade do |t|
    t.string "companyname"
    t.string "email"
    t.bigint "phonenum"
    t.integer "numof_trucks"
    t.string "trucktype"
    t.integer "rentof_truck"
    t.string "taxid"
    t.string "gstid"
    t.integer "created_by_id"
  end

end
