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

ActiveRecord::Schema.define(version: 2018_12_06_163621) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "hetzner_servers", force: :cascade do |t|
    t.integer "number"
    t.string "name"
    t.string "ipv4"
    t.string "ipv6"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "product"
    t.string "status"
    t.string "datacentre"
    t.index ["number"], name: "index_hetzner_servers_on_number"
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resource_attributes", force: :cascade do |t|
    t.bigint "resource_id"
    t.bigint "resource_type_attribute_id"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_id"], name: "index_resource_attributes_on_resource_id"
    t.index ["resource_type_attribute_id"], name: "index_resource_attributes_on_resource_type_attribute_id"
  end

  create_table "resource_type_attributes", force: :cascade do |t|
    t.string "name"
    t.bigint "resource_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_type_id"], name: "index_resource_type_attributes_on_resource_type_id"
  end

  create_table "resource_types", force: :cascade do |t|
    t.string "name"
    t.bigint "provider_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider_id"], name: "index_resource_types_on_provider_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "name"
    t.bigint "resource_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_type_id"], name: "index_resources_on_resource_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", limit: 128
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128
    t.string "first_name", limit: 30
    t.string "middle_name", limit: 30
    t.string "last_name", limit: 30
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

end
