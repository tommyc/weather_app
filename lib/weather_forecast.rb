module WeatherForecast
  def get_weather(location, forecast)
      connection = Faraday.new("https://api.open-meteo.com") do |f|
        f.request :json
        f.request :retry
        f.response :json
    end
    response = connection.get("/v1/forecast", {
      latitude: location.latitude,
      longitude: location.longitude,
      daily: "temperature_2m_max,temperature_2m_min",
      current: "temperature_180m,relative_humidity_2m",
      timezone: location.timezone,
      forecast_days: 1,
      temperature_unit: "fahrenheit"
    })
    body = response.body

    forecast.current_temp = body.dig("current", "temperature_180m")
    forecast.min_temp = body.dig("daily", "temperature_2m_min", 0)
    forecast.max_temp = body.dig("daily", "temperature_2m_max", 0)
    forecast.humidity = body.dig("current", "relative_humidity_2m")
  end
end

