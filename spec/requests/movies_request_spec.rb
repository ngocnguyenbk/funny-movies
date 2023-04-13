require "rails_helper"

RSpec.describe "Movies", type: :request do
  include Warden::Test::Helpers

  let(:user) { create(:user, username: "tester", email: "tester@gmail.com ") }
  let(:movie) { create(:movie, user: user) }

  before do
    login_as(user, scope: :user)
  end

  describe "upvote a movie" do
    it "increases the movie's upvotes by 1" do
      expect do
        post "/api/movies/#{movie.id}/like"
      end.to change { movie.reload.likes_count }.by(1)
    end
  end

  describe "upvote a movie when already upvoted" do
    let(:vote) { create(:vote, user: user, movie: movie, vote_type: :upvote) }

    before do
      vote
      movie.update(likes_count: 1)
    end

    it "does not increase the movie's upvotes" do
      expect do
        post "/api/movies/#{movie.id}/like"
      end.to change { movie.reload.likes_count }.from(1).to(0)
    end
  end

  describe "downvote a movie" do
    it "increases the movie's downvotes by 1" do
      expect do
        post "/api/movies/#{movie.id}/dislike"
      end.to change { movie.reload.dislikes_count }.by(1)
    end
  end

  describe "downvote a movie when already downvoted" do
    let(:vote) { create(:vote, user: user, movie: movie, vote_type: :downvote) }

    before do
      vote
      movie.update(dislikes_count: 1)
    end

    it "does not increase the movie's downvotes" do
      expect do
        post "/api/movies/#{movie.id}/dislike"
      end.to change { movie.reload.dislikes_count }.from(1).to(0)
    end
  end
end
