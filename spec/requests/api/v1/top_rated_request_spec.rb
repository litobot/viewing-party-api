require 'rails_helper'

RSpec.describe "Top Rated", type: :request do
  describe "top rated endpoint" do
    it "returns a list of top rated movies from the external API" do

      json_response = File.read('spec/fixtures/top_rated_movies.json')

      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated").to_return(status: 200, body: json_response)

      get "/api/v1/movies"

      expect(response).to be_successful
      json = JSON.parse(response.body, symbolize_names: true)
    end
  end
end