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

ActiveRecord::Schema.define(version: 20180331184007) do

  create_table "mailing_addresses", force: :cascade do |t|
    t.string "name"
    t.string "addr1"
    t.string "csz"
    t.string "mailing_addressable_type"
    t.integer "mailing_addressable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mailing_addressable_type", "mailing_addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "obligations", force: :cascade do |t|
    t.string "state"
    t.integer "template_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["template_id"], name: "index_obligations_on_template_id"
  end

  create_table "obligees", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "templates", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "obligee_id"
    t.index ["obligee_id"], name: "index_templates_on_obligee_id"
  end

end
