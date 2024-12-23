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

ActiveRecord::Schema[8.0].define(version: 2024_12_23_205049) do
  create_table "group_members", force: :cascade do |t|
    t.integer "group_id"
    t.integer "user_id"
    t.string "recipient_id"
    t.datetime "joined_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id", "user_id"], name: "index_group_members_on_group_id_and_user_id", unique: true
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.string "owner_id", null: false
    t.string "invitation_code"
    t.boolean "is_active", default: false
    t.boolean "distribution_started", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invitation_code"], name: "index_groups_on_invitation_code"
    t.index ["owner_id"], name: "index_groups_on_owner_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "wishlist_items", force: :cascade do |t|
    t.string "user_id", null: false
    t.string "group_id", null: false
    t.string "title", null: false
    t.string "description"
    t.string "url"
    t.decimal "price", precision: 10, scale: 2
    t.integer "priority", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
