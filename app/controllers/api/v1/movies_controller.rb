class Api::V1::MoviesController < ApplicationController
  def index
    json_response = MovieService.top_rated_movies
    movies = json_response[:results]
    render json: MoviesSerializer.format_top_rated_list(movies), status: :ok
  end
end