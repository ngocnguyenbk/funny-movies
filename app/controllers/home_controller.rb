class HomeController < ApplicationController
  def index
    @movies = Movie.preload(:user).order(created_at: :desc)
    @votes = Vote.where(user: current_user)
  end
end
