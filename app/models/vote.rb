class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :user_id, uniqueness: { scope: :movie_id }

  enum vote_type: { downvote: 0, upvote: 1 }
end
