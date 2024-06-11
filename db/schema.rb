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

ActiveRecord::Schema[7.1].define(version: 2024_04_28_234716) do
  create_table "comments", force: :cascade do |t|
    t.integer "lift_id", null: false
    t.integer "user_id", null: false
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lift_id"], name: "index_comments_on_lift_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.string "cnh"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_drivers_on_user_id"
  end

  create_table "lifts", force: :cascade do |t|
    t.integer "driver_id"
    t.integer "passenger_id"
    t.integer "status"
    t.string "start_location"
    t.string "end_location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_lifts_on_driver_id"
    t.index ["passenger_id"], name: "index_lifts_on_passenger_id"
  end

  create_table "lifts_passengers", id: false, force: :cascade do |t|
    t.integer "lift_id", null: false
    t.integer "passenger_id", null: false
    t.string "pickup_location"
    t.string "dropoff_location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lift_id"], name: "index_lifts_passengers_on_lift_id"
    t.index ["passenger_id"], name: "index_lifts_passengers_on_passenger_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_passengers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "iduff"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.integer "driver_id", null: false
    t.string "model"
    t.string "color"
    t.string "license_plate"
    t.integer "capacity"
    t.integer "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["driver_id"], name: "index_vehicles_on_driver_id"
  end

  add_foreign_key "comments", "lifts"
  add_foreign_key "comments", "users"
  add_foreign_key "drivers", "users"
  add_foreign_key "lifts", "drivers"
  add_foreign_key "lifts", "passengers"
  add_foreign_key "passengers", "users"
  add_foreign_key "vehicles", "drivers"
end
