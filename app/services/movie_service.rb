class MovieService
  def self.top_rated_movies
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.headers["Authorization"] = Rails.application.credentials[:movies_key]
    end

    response = conn.get("/3/movie/top_rated")

    json = JSON.parse(response.body, symbolize_names: true)
  end

  # This is a translator that speaks to the ext API from within my API

  

  # def self.call_db(endpoint, params = {})
  #   response = connection.get(endpoint) do |req|
  #     req.params = params
  #     req.params[:api_key] = Rails.application.credentials[:movies_key]
  #   end
  #   parse_data(response)
  # end

  # def self.connection
  #   Faraday.new("https://api.themoviedb.org")
  # end

  # def self.parse_data(data)
  #   JSON.parse(data.body, symbolize_names: true)
  # end
end