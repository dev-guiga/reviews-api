FactoryBot.define do
  factory :reaction_comment do
    reaction { Faker::Boolean.boolean }
    comment_id { create(:comment).id }
    user_id { create(:user).id }
  end
end
