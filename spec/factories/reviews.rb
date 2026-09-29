FactoryBot.define do
  factory :review do
    name { Faker::Book.title }
    description { Faker::Lorem.characters(number: 40) }
    review_type { %w[book game movie_and_series podcast].sample }
    overall_review { Faker::Number.between(from: 1, to: 10) }
    main_review { Faker::Lorem.paragraph }
    like_total { Faker::Number.between(from: 0, to: 100) }
    dislike_total { Faker::Number.between(from: 0, to: 100) }
    user_id { create(:user).id }
    recommended { Faker::Boolean.boolean }
    recommended_for { %w[children adolescent young adult].sample }
    spoiler { Faker::Boolean.boolean }
  end
end
