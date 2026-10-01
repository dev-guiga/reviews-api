FactoryBot.define do
  factory :book_review do
    reading_difficulty { %w[low medium high very_high].sample }
    story_rating { Faker::Number.between(from: 1, to: 10) }
    characters_rating { Faker::Number.between(from: 1, to: 10) }
    pacing_rating { Faker::Number.between(from: 1, to: 10) }
    ending_rating { Faker::Number.between(from: 1, to: 10) }
    themes_rating { Faker::Lorem.word }
    review_id { create(:review).id }
    metadata { { source: Faker::Book.publisher } }
    external_id { Faker::Alphanumeric.alphanumeric(number: 12) }
  end
end
