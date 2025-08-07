module Geocoder
  def geocode(location)
    connection = Faraday.new("https://geocoding-api.open-meteo.com") do |f|
      f.request :json
      f.request :retry
      f.response :json
    end
    response = connection.get("/v1/search", {
      name: location.zipcode,
      countryCode: "US"

    })

    body = response.body
    if response.status == 200 && body.has_key?("results")
      results = body["results"][0]
      location.assign_attributes(address: location.address,
      latitude: results["latitude"],
      longitude: results["longitude"],
      timezone: results["timezone"]
      )
    else
      Rails.logger.error("Geocoding failed")
    end
  end
end
