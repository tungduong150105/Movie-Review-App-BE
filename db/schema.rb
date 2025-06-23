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

ActiveRecord::Schema[7.0].define(version: 2025_06_23_032754) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "type_name"
    t.string "_id"
    t.string "body"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "forums", force: :cascade do |t|
    t.string "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "forum_id", null: false
    t.bigint "user_id", null: false
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["forum_id"], name: "index_messages_on_forum_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "movieinfors", force: :cascade do |t|
    t.string "type_name"
    t.string "_id"
    t.string "name"
    t.string "img_url"
    t.string "release_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rating"
    t.index ["type_name", "_id"], name: "index_movieinfors_on_type_name_and__id", unique: true
  end

  create_table "people", force: :cascade do |t|
    t.string "person_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_people_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.string "type_name"
    t.string "_id"
    t.string "rating"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "recents", force: :cascade do |t|
    t.string "type_name"
    t.string "_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_recents_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_reset_token"
    t.datetime "password_reset_token_expires_at"
  end

  create_table "watchlists", force: :cascade do |t|
    t.string "_id"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type_name"
    t.index ["user_id"], name: "index_watchlists_on_user_id"
  end

  add_foreign_key "comments", "users"
  add_foreign_key "messages", "forums"
  add_foreign_key "messages", "users"
  add_foreign_key "people", "users"
  add_foreign_key "ratings", "users"
  add_foreign_key "recents", "users"
  add_foreign_key "watchlists", "users"
end
