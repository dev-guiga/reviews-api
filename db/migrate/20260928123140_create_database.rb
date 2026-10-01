class CreateDatabase < ActiveRecord::Migration[8.1]
  def change
    create_enum :review_types, %w[book game movie_and_series podcast]
    create_enum :difficulty, %w[low medium high very_high]
    create_enum :public, %w[children adolescent young adult]
    create_enum :status, %w[draft publish deletead_at archived_at]

    create_table :users, id: :integer do |t|
      t.string :name, limit: 255, null: false
      t.string :username, limit: 255, null: false
      t.text :bio
      t.string :phone_number, limit: 255
      t.timestamps

      t.index :username, unique: true
    end

    create_table :reviews, id: :integer do |t|
      t.string :name, limit: 255, null: false
      t.string :description, limit: 255
      t.enum :review_type, enum_type: :review_types, null: false
      t.enum :status, enum_type: :status
      t.integer :overall_review
      t.text :main_review
      t.integer :like_total
      t.integer :dislike_total
      t.integer :user_id, null: false
      t.boolean :recommended
      t.enum :recommended_for, enum_type: :public
      t.boolean :spoiler
      t.datetime :discarded_at
      t.datetime :archived_at
      t.timestamps

      t.index :user_id, name: 'reviews_index_0'
      t.index :discarded_at
      t.index :archived_at
    end

    create_table :interaction_reviews, id: :integer do |t|
      t.boolean :reaction
      t.integer :review_id, null: false
      t.integer :user_id, null: false
      t.timestamps

      t.index [ :user_id, :review_id ], unique: true, name: 'interactions_reviews_index_0'
    end

    create_table :comments, id: :integer do |t|
      t.text :comments
      t.integer :like_total
      t.integer :dislike_total
      t.integer :review_id, null: false
      t.integer :user_id, null: false
      t.timestamps

      t.index :user_id, name: 'comments_index_0'
      t.index :review_id, name: 'comments_index_1'
    end

    create_table :reaction_comments, id: :integer do |t|
      t.boolean :reaction
      t.integer :comment_id, null: false
      t.integer :user_id, null: false
      t.timestamps

      t.index [ :user_id, :comment_id ], unique: true, name: 'reactions_comments_index_0'
    end

    create_table :book_reviews, id: :integer do |t|
      t.enum :reading_difficulty, enum_type: :difficulty
      t.integer :story_rating
      t.integer :characters_rating
      t.integer :pacing_rating
      t.integer :ending_rating
      t.string :themes_rating, limit: 255
      t.integer :review_id
      t.json :metadata
      t.string :external_id, limit: 255
      t.timestamps

      t.index :review_id, unique: true, name: 'books_reviews_index_0'
    end

    create_table :favorite_items, id: :integer do |t|
      t.string :favoritable_type, limit: 255, null: false
      t.integer :favoritable_id, null: false
      t.string :item_type, limit: 255
      t.text :value
      t.timestamps

      t.index [ :favoritable_type, :favoritable_id ], name: 'index_favorite_items_on_favoritable'
    end

    add_foreign_key :reviews, :users, column: :user_id, name: 'fk_reviews_user_id_users'
    add_foreign_key :interaction_reviews, :users, column: :user_id, name: 'fk_interactions_reviews_user_id_users'
    add_foreign_key :interaction_reviews, :reviews, column: :review_id, name: 'fk_interactions_reviews_review_id_reviews'
    add_foreign_key :comments, :users, column: :user_id, name: 'fk_comments_user_id_users'
    add_foreign_key :comments, :reviews, column: :review_id, name: 'fk_comments_review_id_reviews'
    add_foreign_key :reaction_comments, :users, column: :user_id, name: 'fk_reactions_comments_user_id_users'
    add_foreign_key :reaction_comments, :comments, column: :comment_id, name: 'fk_reactions_comments_comment_id_comments'
    add_foreign_key :book_reviews, :reviews, column: :review_id, name: 'fk_books_reviews_review_id_reviews'
  end
end
