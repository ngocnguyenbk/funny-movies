module Api
  class MoviesController < ApplicationController
    before_action :authenticate_user!

    def like
      result, message = VoteMovieService.call(current_user, movie, :upvote)
      if result
        render json: { message: message }, status: :ok
      else
        render json: { message: message }, status: :unprocessable_entity
      end
    end

    def dislike
      result, message = VoteMovieService.call(current_user, movie, :downvote)
      if result
        render json: { message: message }, status: :ok
      else
        render json: { message: message }, status: :unprocessable_entity
      end
    end

    private

    def movie
      @movie ||= Movie.find(params[:id])
    end
  end
end
