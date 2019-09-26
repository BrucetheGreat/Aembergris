# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_26_215432) do

  create_table "archons", force: :cascade do |t|
    t.string "name"
    t.string "uuid"
    t.integer "chains"
    t.string "color"
    t.integer "lodge_id", null: false
    t.index ["lodge_id"], name: "index_archons_on_lodge_id"
  end

  create_table "archons_houses", id: false, force: :cascade do |t|
    t.integer "archon_id", null: false
    t.integer "house_id", null: false
    t.index ["archon_id", "house_id"], name: "index_archons_houses_on_archon_id_and_house_id"
    t.index ["house_id", "archon_id"], name: "index_archons_houses_on_house_id_and_archon_id"
  end

  create_table "battles", force: :cascade do |t|
    t.integer "lodge_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lodge_id"], name: "index_battles_on_lodge_id"
  end

  create_table "houses", force: :cascade do |t|
    t.string "name"
    t.string "icon_link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lodges", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "archons", "lodges"
  add_foreign_key "battles", "lodges"
end