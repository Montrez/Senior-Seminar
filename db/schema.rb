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

ActiveRecord::Schema.define(version: 2019_04_29_204226) do

  create_table "accounts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "accountable_type"
    t.integer "accountable_id"
    t.index ["accountable_type", "accountable_id"], name: "index_accounts_on_accountable_type_and_accountable_id"
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "actual_expenses", force: :cascade do |t|
    t.string "expense_type"
    t.float "total"
    t.integer "requests_id"
    t.integer "expense_report_id"
    t.boolean "status", default: false
    t.date "dateincurred"
    t.string "imageurl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "comment"
    t.index ["expense_report_id"], name: "index_actual_expenses_on_expense_report_id"
    t.index ["requests_id"], name: "index_actual_expenses_on_requests_id"
  end

  create_table "admin_accounts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "approvers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "estimated_expenses_id"
    t.integer "actual_expenses_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "department_id"
    t.index ["actual_expenses_id"], name: "index_approvers_on_actual_expenses_id"
    t.index ["department_id"], name: "index_approvers_on_department_id"
    t.index ["estimated_expenses_id"], name: "index_approvers_on_estimated_expenses_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "department"
    t.float "budget"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estimated_expenses", force: :cascade do |t|
    t.string "expense_type"
    t.float "total"
    t.integer "requests_id"
    t.integer "trip_id"
    t.boolean "status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "comment"
    t.index ["requests_id"], name: "index_estimated_expenses_on_requests_id"
    t.index ["trip_id"], name: "index_estimated_expenses_on_trip_id"
  end

  create_table "expense_reports", force: :cascade do |t|
    t.integer "actual_expenses_id"
    t.integer "trip_id"
    t.boolean "status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "submitter_id"
    t.integer "approvers_id"
    t.integer "managers_id"
    t.text "comment"
    t.index ["actual_expenses_id"], name: "index_expense_reports_on_actual_expenses_id"
    t.index ["approvers_id"], name: "index_expense_reports_on_approvers_id"
    t.index ["managers_id"], name: "index_expense_reports_on_managers_id"
    t.index ["submitter_id"], name: "index_expense_reports_on_submitter_id"
    t.index ["trip_id"], name: "index_expense_reports_on_trip_id"
  end

  create_table "managers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "trips_id"
    t.integer "expense_reports_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_reports_id"], name: "index_managers_on_expense_reports_id"
    t.index ["trips_id"], name: "index_managers_on_trips_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "department"
    t.float "percentrequested"
    t.boolean "status", default: false
    t.integer "estimated_expense_id"
    t.integer "actual_expense_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "comment"
    t.float "amount_from_total"
    t.string "destination"
    t.text "expense_type"
    t.index ["actual_expense_id"], name: "index_requests_on_actual_expense_id"
    t.index ["estimated_expense_id"], name: "index_requests_on_estimated_expense_id"
  end

  create_table "submitters", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "trips_id"
    t.integer "expense_reports_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_reports_id"], name: "index_submitters_on_expense_reports_id"
    t.index ["trips_id"], name: "index_submitters_on_trips_id"
  end

  create_table "trips", force: :cascade do |t|
    t.integer "estimated_expenses_id"
    t.integer "managers_id"
    t.integer "submitter_id"
    t.string "destination"
    t.text "purpose"
    t.date "todate"
    t.date "fromdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "approvers_id"
    t.boolean "status", default: false
    t.text "comment"
    t.index ["approvers_id"], name: "index_trips_on_approvers_id"
    t.index ["estimated_expenses_id"], name: "index_trips_on_estimated_expenses_id"
    t.index ["managers_id"], name: "index_trips_on_managers_id"
    t.index ["submitter_id"], name: "index_trips_on_submitter_id"
  end

end
