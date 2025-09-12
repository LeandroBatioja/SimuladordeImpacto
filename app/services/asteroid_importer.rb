require 'httparty'

class AsteroidImporter
  BASE_URL = "https://api.nasa.gov/neo/rest/v1/feed"
  API_KEY = "Lm7tvnaLVbmnFctcF9ejAc8lIo4A65ILhiIqPCRC" # ⚠️ Reemplázalo con tu propia API key de NASA

  def self.import(start_date = Date.today, end_date = Date.today + 2)
    url = "#{BASE_URL}?start_date=#{start_date}&end_date=#{end_date}&api_key=#{API_KEY}"
    response = HTTParty.get(url)

    if response.success?
      data = response.parsed_response["near_earth_objects"]
      data.each do |date, asteroids|
        asteroids.each do |ast|
          Asteroid.find_or_create_by(name: ast["name"]) do |a|
            a.diameter = ast["estimated_diameter"]["kilometers"]["estimated_diameter_max"]
            a.velocity = ast["close_approach_data"].first["relative_velocity"]["kilometers_per_second"].to_f
            a.impact_probability = rand(0.0..0.1).round(4) # NASA no da esto directo, lo simulamos
          end
        end
      end
    else
      Rails.logger.error("Error al importar datos de la NASA: #{response.code}")
    end
  end
end
