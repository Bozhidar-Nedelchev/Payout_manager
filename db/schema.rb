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

ActiveRecord::Schema[7.0].define(version: 2023_09_12_143720) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.boolean "active", default: true
    t.string "name"
    t.bigint "client_id", null: false
    t.string "uid"
    t.string "secret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_applications_on_client_id"
    t.index ["uid"], name: "index_applications_on_uid", unique: true
  end

  create_table "brands", force: :cascade do |t|
    t.boolean "active"
    t.string "name"
    t.text "description"
    t.string "redemption"
    t.bigint "merchant_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["merchant_id"], name: "index_brands_on_merchant_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "status"
    t.bigint "product_id", null: false
    t.decimal "amount", precision: 10, scale: 2
    t.string "activation_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_cards_on_product_id"
  end

  create_table "clients", force: :cascade do |t|
    t.boolean "active"
    t.string "name"
    t.bigint "country_id", null: false
    t.decimal "payout_rate", precision: 5, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_clients_on_country_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "currency"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "merchants", force: :cascade do |t|
    t.boolean "active"
    t.string "name"
    t.bigint "country_id", null: false
    t.decimal "payout_rate", precision: 5, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_merchants_on_country_id"
  end

  create_table "products", force: :cascade do |t|
    t.boolean "active"
    t.string "name"
    t.decimal "amount", precision: 10, scale: 2
    t.bigint "brand_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_products_on_brand_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.decimal "client_amount", precision: 10, scale: 2
    t.decimal "merchant_amount", precision: 10, scale: 2
    t.string "reference_number"
    t.bigint "card_id", null: false
    t.bigint "application_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_id"], name: "index_transactions_on_application_id"
    t.index ["card_id"], name: "index_transactions_on_card_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.boolean "sales_role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "applications", "clients"
  add_foreign_key "brands", "merchants"
  add_foreign_key "cards", "products"
  add_foreign_key "clients", "countries"
  add_foreign_key "merchants", "countries"
  add_foreign_key "products", "brands"
  add_foreign_key "transactions", "applications"
  add_foreign_key "transactions", "cards"
end
