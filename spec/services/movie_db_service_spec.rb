require 'rails_helper'

describe MovieService do
  context "instance methods" do
    it "can make an API call to a database" do
      query = MovieService.call_db("3/movie/top_rated")
      # Gives us the results of the API call.
      # We grab the first movie ("Shashank Redemption")
      movie_data = query[:results].first
      
      require "pry"; binding.pry
      expect(query).to be_a Hash
      expect(movie_data).to be_a Hash
      expect(movie_data).to have_key :title
      expect(movie_data[:title]).to be_a(String)
      expect(movie_data).to have_key :vote_average
      expect(movie_data[:vote_average]).to be_a(Numeric)
    end
  end
end