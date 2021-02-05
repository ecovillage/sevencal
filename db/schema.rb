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

ActiveRecord::Schema.define(version: 2021_02_05_142533) do

  create_table "event_sources", force: :cascade do |t|
    t.string "location"
    t.string "name"
    t.datetime "synced_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "kind"
    t.string "slug"
    t.index ["slug"], name: "index_event_sources_on_slug", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.string "uuid"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "event_source_id", null: false
    t.index ["event_source_id"], name: "index_events_on_event_source_id"
  end

  add_foreign_key "events", "event_sources"
end
