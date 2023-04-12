module Api
  class MoviesController < ApplicationController
    def like
      movie.like!
      render json: { likes: movie.likes_count, dislikes: movie.dislikes_count }
    end

    def dislike
      movie.dislike!
      render json: { likes: movie.likes_count, dislikes: movie.dislikes_count }
    end

    private

    def movie
      @movie ||= Movie.find(params[:id])
    end
  end
end
