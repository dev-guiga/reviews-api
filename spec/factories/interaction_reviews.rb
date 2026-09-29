FactoryBot.define do
  factory :interaction_review do
    reaction { Faker::Boolean.boolean }
    review_id { create(:review).id }
    user_id { create(:user).id }
  end
end
