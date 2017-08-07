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

ActiveRecord::Schema.define(version: 20170807143003) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "rental_id", null: false
    t.date "start_date", null: false
    t.date "stop_date", null: false
    t.integer "guests", null: false
    t.integer "review_score"
    t.text "review_comments"
    t.datetime "reviewed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rental_id"], name: "index_bookings_on_rental_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "rentals", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "rental_type", null: false
    t.integer "accommodates", null: false
    t.integer "bathrooms", null: false
    t.integer "bedrooms", null: false
    t.integer "beds", null: false
    t.decimal "nightly_cost", precision: 8, scale: 2, null: false
    t.text "description"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.string "street1", null: false
    t.string "street2"
    t.string "city", null: false
    t.string "province"
    t.string "country", null: false
    t.string "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_rentals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
