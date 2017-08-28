# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create_table "albums", force: :cascade do |t|
#   t.string "title", null: false
#   t.integer "year", null: false
#   t.integer "band_id", null: false
#   t.boolean "live", default: false
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["band_id"], name: "index_albums_on_band_id"
# end
#
# create_table "bands", force: :cascade do |t|
#   t.string "name", null: false
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["name"], name: "index_bands_on_name"
# end
#
# create_table "notes", force: :cascade do |t|
#   t.integer "user_id", null: false
#   t.integer "track_id", null: false
#   t.text "note_body", null: false
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["track_id"], name: "index_notes_on_track_id"
#   t.index ["user_id"], name: "index_notes_on_user_id"
# end
# 
# create_table "tracks", force: :cascade do |t|
#   t.string "title", null: false
#   t.integer "track_number", null: false
#   t.boolean "bonus", default: false
#   t.integer "album_id", null: false
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["album_id"], name: "index_tracks_on_album_id"
# end
#
# create_table "users", force: :cascade do |t|
#   t.string "email", null: false
#   t.string "password_digest", null: false
#   t.string "session_token", null: false
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["password_digest"], name: "index_users_on_password_digest"
# end
