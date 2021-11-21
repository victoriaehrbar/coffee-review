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

ActiveRecord::Schema.define(version: 2021_11_17_195300) do

  create_table "brands", force: :cascade do |t|
    t.string "brand_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "coffees", force: :cascade do |t|
    t.string "name"
    t.string "roast_type"
    t.string "description"
    t.integer "brand_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["brand_id"], name: "index_coffees_on_brand_id"
    t.index ["user_id"], name: "index_coffees_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "score"
    t.string "title"
    t.string "content"
    t.integer "user_id", null: false
    t.integer "coffee_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coffee_id"], name: "index_reviews_on_coffee_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "coffees", "brands"
  add_foreign_key "coffees", "users"
  add_foreign_key "reviews", "coffees"
  add_foreign_key "reviews", "users"
end
