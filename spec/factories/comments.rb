FactoryBot.define do
  factory :comment do
    comments { Faker::Lorem.paragraph }
    like_total { Faker::Number.between(from: 0, to: 100) }
    dislike_total { Faker::Number.between(from: 0, to: 100) }
    review_id { create(:review).id }
    user_id { create(:user).id }
  end
end
