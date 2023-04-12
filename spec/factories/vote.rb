FactoryBot.define do
  factory :vote do
    association :user
    association :movie
    vote_type { %i[downvote upvote] }
  end
end
