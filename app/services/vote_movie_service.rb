class VoteMovieService < ApplicationService
  attr_reader :user, :movie, :vote_type

  def initialize(user, movie, vote_type)
    @user = user
    @movie = movie
    @vote_type = vote_type
  end

  def call
    ActiveRecord::Base.transaction do
      handle_vote
      update_movie_votes_count
      true
    end
  rescue ActiveRecord::RecordInvalid => e
    [false, e.message]
  end

  private

  def vote
    @vote ||= movie.votes.find_or_initialize_by(user: user, vote_type: vote_type)
  end

  def handle_vote
    if vote.persisted?
      vote.destroy!
    else
      vote.save!
    end
  end

  def update_movie_votes_count
    movie.update!(
      likes_count: movie.votes.upvote.count,
      dislikes_count: movie.votes.downvote.count
    )
  end
end
