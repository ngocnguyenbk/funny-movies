require "rails_helper"

RSpec.describe VoteMovieService, type: :service do
  describe "#call" do
    let(:user) { create(:user) }
    let(:movie) { create(:movie, user: user) }
    let(:vote_type) { "upvote" }
    let(:service) { described_class.new(user, movie, vote_type) }

    context "when vote is upvote" do
      it "creates a vote" do
        expect { service.call }.to change { Vote.count }.by(1)
      end

      it "returns true" do
        expect(service.call).to eq(true)
      end

      it "updates movie likes_count" do
        expect { service.call }.to change { movie.reload.likes_count }.by(1)
      end

      it "updates movie dislikes_count" do
        expect { service.call }.to change { movie.reload.dislikes_count }.by(0)
      end
    end

    context "when vote is downvote" do
      let(:vote_type) { "downvote" }

      it "creates a vote" do
        expect { service.call }.to change { Vote.count }.by(1)
      end

      it "updates movie likes_count" do
        expect { service.call }.to change { movie.reload.likes_count }.by(0)
      end

      it "updates movie dislikes_count" do
        expect { service.call }.to change { movie.reload.dislikes_count }.by(1)
      end
    end

    context "when vote is already created is upvote" do
      let(:movie) { create(:movie, user: user, likes_count: 1) }
      before { create(:vote, user: user, movie: movie, vote_type: "upvote") }

      it "destroys a vote" do
        expect { service.call }.to change { Vote.count }.by(-1)
      end

      it "updates movie likes_count" do
        expect { service.call }.to change { movie.reload.likes_count }.by(-1)
      end

      it "updates movie dislikes_count" do
        expect { service.call }.to change { movie.reload.dislikes_count }.by(0)
      end
    end

    context "when vote is already created is downvote" do
      let(:movie) { create(:movie, user: user, dislikes_count: 1) }
      let(:vote_type) { "downvote" }
      before { create(:vote, user: user, movie: movie, vote_type: "downvote") }

      it "destroys a vote" do
        expect { service.call }.to change { Vote.count }.by(-1)
      end

      it "updates movie likes_count" do
        expect { service.call }.to change { movie.reload.likes_count }.by(0)
      end

      it "updates movie dislikes_count" do
        expect { service.call }.to change { movie.reload.dislikes_count }.by(-1)
      end
    end
  end
end
