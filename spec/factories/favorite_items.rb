FactoryBot.define do
  factory :favorite_item do
    favoritable_type { 'BookReview' }
    favoritable_id { create(:book_review).id }
    item_type { Faker::Lorem.word }
    value { Faker::Lorem.sentence }
  end
end
