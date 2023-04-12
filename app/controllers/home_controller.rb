class HomeController < ApplicationController
  def index
    @movies = Movie.all.preload(:user).order(created_at: :desc)
  end
end
