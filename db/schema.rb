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

ActiveRecord::Schema[8.1].define(version: 2026_09_28_123140) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "difficulty", ["low", "medium", "high", "very_high"]
  create_enum "public", ["children", "adolescent", "young", "adult"]
  create_enum "review_types", ["book", "game", "movie_and_series", "podcast"]
  create_enum "status", ["draft", "publish", "deletead_at", "archived_at"]

  create_table "book_reviews", id: :serial, force: :cascade do |t|
    t.integer "characters_rating"
    t.datetime "created_at", null: false
    t.integer "ending_rating"
    t.string "external_id", limit: 255
    t.json "metadata"
    t.integer "pacing_rating"
    t.enum "reading_difficulty", enum_type: "difficulty"
    t.integer "review_id"
    t.integer "story_rating"
    t.string "themes_rating", limit: 255
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "books_reviews_index_0", unique: true
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.text "comments"
    t.datetime "created_at", null: false
    t.integer "dislike_total"
    t.integer "like_total"
    t.integer "review_id", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["review_id"], name: "comments_index_1"
    t.index ["user_id"], name: "comments_index_0"
  end

  create_table "favorite_items", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "favoritable_id", null: false
    t.string "favoritable_type", limit: 255, null: false
    t.string "item_type", limit: 255
    t.text "value"
    t.datetime "updated_at", null: false
    t.index ["favoritable_type", "favoritable_id"], name: "index_favorite_items_on_favoritable"
  end

  create_table "interaction_reviews", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.boolean "reaction"
    t.integer "review_id", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id", "review_id"], name: "interactions_reviews_index_0", unique: true
  end

  create_table "reaction_comments", id: :serial, force: :cascade do |t|
    t.integer "comment_id", null: false
    t.datetime "created_at", null: false
    t.boolean "reaction"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id", "comment_id"], name: "reactions_comments_index_0", unique: true
  end

  create_table "reviews", id: :serial, force: :cascade do |t|
    t.datetime "archived_at"
    t.datetime "created_at", null: false
    t.string "description", limit: 255
    t.datetime "discarded_at"
    t.integer "dislike_total"
    t.integer "like_total"
    t.text "main_review"
    t.string "name", limit: 255, null: false
    t.integer "overall_review"
    t.boolean "recommended"
    t.enum "recommended_for", enum_type: "public"
    t.enum "review_type", null: false, enum_type: "review_types"
    t.boolean "spoiler"
    t.enum "status", enum_type: "status"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["archived_at"], name: "index_reviews_on_archived_at"
    t.index ["discarded_at"], name: "index_reviews_on_discarded_at"
    t.index ["user_id"], name: "reviews_index_0"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.text "bio"
    t.datetime "created_at", null: false
    t.string "name", limit: 255, null: false
    t.string "phone_number", limit: 255
    t.string "username", limit: 255, null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "book_reviews", "reviews", name: "fk_books_reviews_review_id_reviews"
  add_foreign_key "comments", "reviews", name: "fk_comments_review_id_reviews"
  add_foreign_key "comments", "users", name: "fk_comments_user_id_users"
  add_foreign_key "interaction_reviews", "reviews", name: "fk_interactions_reviews_review_id_reviews"
  add_foreign_key "interaction_reviews", "users", name: "fk_interactions_reviews_user_id_users"
  add_foreign_key "reaction_comments", "comments", name: "fk_reactions_comments_comment_id_comments"
  add_foreign_key "reaction_comments", "users", name: "fk_reactions_comments_user_id_users"
  add_foreign_key "reviews", "users", name: "fk_reviews_user_id_users"
end
