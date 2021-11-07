require 'uri'
require 'net/http'

class WeatherService
  API_KEY = 'fef8062aba97e5be2d6431bda8847e7b'.freeze

  def cod
    result = JSON.parse(parse_data)

    result['cod']
  end

  def parse_data
    uri = URI("https://api.openweathermap.org/data/2.5/weather?q=London&appid=#{API_KEY}")
    res = Net::HTTP.get_response(uri)
    return res.body if res.is_a?(Net::HTTPSuccess)
  end
end
