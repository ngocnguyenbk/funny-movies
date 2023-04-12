class CreateMovieService < ApplicationService
  attr_reader :url, :user, :movie

  def initialize(url, user)
    @url = url
    @user = user
    @movie = user.movies.new
  end

  def call
    ActiveRecord::Base.transaction do
      movie.update!(movie_params)
      true
    end
  rescue ActiveRecord::RecordInvalid
    [false, movie.errors.full_messages.join(", ")]
  rescue VideoInfo::UrlError => e
    [false, e.message]
  end

  private

  def movie_params
    movie = VideoInfo.new(url)
    {
      title: movie.title,
      description: movie.description,
      thumbnail_url: movie.thumbnail_medium,
      url: url
    }
  end
end
