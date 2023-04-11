class CreateMovieService < ApplicationService
  attr_reader :url, :user

  def initialize(url, user)
    @url = url
    @user = user
    VideoInfo.provider_api_keys = { youtube: "AIzaSyD3MSPXFZJdc94uDhWIt4oS8tTYl4PH_8E" }
  end

  def call
    ActiveRecord::Base.transaction do
      movie = user.movies.new(movie_params)
      movie.save!
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
