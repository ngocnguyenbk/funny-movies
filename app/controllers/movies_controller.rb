class MoviesController < ApplicationController
  def share
    @movie = current_user.movies.new
  end

  def create
    result, message = CreateMovieService.call(movie_params[:url], current_user)
    if result
      flash[:notice] = t(".success")
      redirect_to root_path
    else
      @movie = current_user.movies.new(movie_params)
      flash.now[:alert] = message
      render :share
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:url)
  end
end
