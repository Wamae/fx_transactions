# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022042113415) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "currencies", force: :cascade do |t|
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "email", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fx_transactions", force: :cascade do |t|
    t.uuid "identifier", null: false
    t.decimal "in_amount", precision: 10, scale: 2
    t.bigint "in_currency_id"
    t.decimal "out_amount", precision: 10, scale: 2
    t.bigint "out_currency_id"
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_fx_transactions_on_customer_id"
    t.index ["in_currency_id"], name: "index_fx_transactions_on_in_currency_id"
    t.index ["out_currency_id"], name: "index_fx_transactions_on_out_currency_id"
  end

  add_foreign_key "fx_transactions", "currencies", column: "in_currency_id"
  add_foreign_key "fx_transactions", "currencies", column: "out_currency_id"
  add_foreign_key "fx_transactions", "customers"
end
