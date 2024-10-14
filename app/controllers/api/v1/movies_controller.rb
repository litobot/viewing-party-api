class Api::V1::MoviesController < ApplicationController
  def index
    if params[:query]
      json_response = MovieService.search_query(params[:query])
    else
      json_response = MovieService.top_rated_movies
    end

    movies = json_response[:results]
    render json: MoviesSerializer.format_top_rated_list(movies), status: :ok
    # MoviesSerializer.format_top_rated_list(movies) properly formats the json how to match the requirements with the correct attributes, etc.
  end
end