class MovieService
  def self.top_rated_movies
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
      faraday.headers["Authorization"] = Rails.application.credentials[:movies_key]
    end

    response = conn.get("/3/movie/top_rated")
    parse_json(response)
  end

  def self.search_query(query)
    conn = Faraday.new(url: "https://api.themoviedb.org") do |faraday|
    end

    response = conn.get("/3/search/movie", { query: query })
    parse_json(response)
  end

  private

  def self.parse_json
    JSON.parse(response.body, symbolize_names: true)
  end

  # MovieService is a translator that speaks to the external API from within my API
end