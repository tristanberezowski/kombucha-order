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

ActiveRecord::Schema.define(version: 2020_02_05_235403) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_tokens", force: :cascade do |t|
    t.string "name"
    t.datetime "date_created"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cart_products", force: :cascade do |t|
    t.bigint "cart_id"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity", default: 1, null: false
    t.index ["cart_id"], name: "index_cart_products_on_cart_id"
    t.index ["product_id"], name: "index_cart_products_on_product_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "containers", force: :cascade do |t|
    t.string "name"
    t.integer "volume", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "USD", null: false
    t.integer "environmental_fee_cents", default: 0, null: false
    t.string "environmental_fee_currency", default: "USD", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "delivery_exemptions", force: :cascade do |t|
    t.integer "fee_cents", default: 0, null: false
    t.string "fee_currency", default: "USD", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "extra_selections", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flavours", force: :cascade do |t|
    t.bigint "liquid_id"
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "USD", null: false
    t.index ["liquid_id"], name: "index_flavours_on_liquid_id"
  end

  create_table "invite_exemptions", force: :cascade do |t|
    t.bigint "invite_id"
    t.string "exemptable_type"
    t.bigint "exemptable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exemptable_type", "exemptable_id"], name: "index_invite_exemptions_on_exemptable_type_and_exemptable_id"
    t.index ["invite_id"], name: "index_invite_exemptions_on_invite_id"
  end

  create_table "invites", force: :cascade do |t|
    t.string "email"
    t.bigint "admin_id"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.bigint "user_id"
    t.index ["admin_id"], name: "index_invites_on_admin_id"
    t.index ["user_id"], name: "index_invites_on_user_id"
  end

  create_table "liquid_selections", force: :cascade do |t|
    t.bigint "flavour_id"
    t.bigint "container_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["container_id"], name: "index_liquid_selections_on_container_id"
    t.index ["flavour_id"], name: "index_liquid_selections_on_flavour_id"
  end

  create_table "liquids", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_products", force: :cascade do |t|
    t.bigint "order_id"
    t.bigint "product_id"
    t.integer "quantity", default: 1, null: false
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "USD", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_products_on_order_id"
    t.index ["product_id"], name: "index_order_products_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "billing_name"
    t.string "billing_address"
    t.string "billing_city"
    t.string "billing_province"
    t.string "billing_postal"
    t.string "billing_country"
    t.string "shipping_name"
    t.string "shipping_address"
    t.string "shipping_city"
    t.string "shipping_province"
    t.string "shipping_postal"
    t.string "shipping_country"
    t.string "note"
    t.string "delivery_status"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "product_exemptions", force: :cascade do |t|
    t.bigint "product_id"
    t.integer "fee_cents", default: 0, null: false
    t.string "fee_currency", default: "USD", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_exemptions_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.boolean "rentable"
    t.boolean "purchasable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "USD", null: false
    t.string "selectable_type"
    t.bigint "selectable_id"
    t.index ["selectable_type", "selectable_id"], name: "index_products_on_selectable_type_and_selectable_id"
  end

  create_table "realm_ids", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "refresh_tokens", force: :cascade do |t|
    t.string "name"
    t.datetime "date_created"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_exemptions", force: :cascade do |t|
    t.float "delivery_fee"
    t.float "order_minimum"
    t.bigint "user_id"
    t.string "exemptable_type"
    t.bigint "exemptable_id"
    t.index ["exemptable_type", "exemptable_id"], name: "index_user_exemptions_on_exemptable_type_and_exemptable_id"
    t.index ["user_id"], name: "index_user_exemptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "shipping_address"
    t.string "shipping_city"
    t.string "shipping_postal"
    t.string "shipping_province"
    t.string "company_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cart_products", "carts"
  add_foreign_key "cart_products", "products"
  add_foreign_key "carts", "users"
  add_foreign_key "flavours", "liquids"
  add_foreign_key "invite_exemptions", "invites"
  add_foreign_key "invites", "admins"
  add_foreign_key "invites", "users"
  add_foreign_key "liquid_selections", "containers"
  add_foreign_key "liquid_selections", "flavours"
  add_foreign_key "order_products", "orders"
  add_foreign_key "order_products", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "product_exemptions", "products"
  add_foreign_key "user_exemptions", "users"
end
