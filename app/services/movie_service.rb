class MovieService
  def self.call_db(endpoint, params = {})
    response = connection.get(endpoint) do |req|
      req.params = params
      req.params[:api_key] = Rails.application.credentials[:movies_key]
    end
    parse_data(response)
  end

  def self.connection
    Faraday.new("https://api.themoviedb.org")
  end

  def self.parse_data(data)
    JSON.parse(data.body, symbolize_names: true)
  end
end