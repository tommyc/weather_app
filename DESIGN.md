# Weather App  

## Requirements
- Must be done in Ruby on Rails
- Accept an address as input
- Retrieve forecast data for the given address. This should include, at minimum, the
current temperature (Bonus points - Retrieve high/low and/or extended forecast)
- Display the requested forecast details to the user
- Cache the forecast details for 30 minutes for all subsequent requests by zip codes.
Display indicator if result is pulled from cache.
 
## references  
  
[National Weather Service](https://www.weather.gov/documentation/services-web-api)  
[National Weather Service API Docs](https://weather-gov.github.io/api/general-faqs)  

[Open Meteo](https://open-meteo.com/en/features#available_apis)


### Open Meteo Geocoding API
[Example GeoCode API URL](https://geocoding-api.open-meteo.com/v1/search?name=30334&CountryCode=us)

### Geocode Results
{"results":[{"id":4180439,"name":"Atlanta","latitude":33.749,"longitude":-84.38798,"elevation":320.0,"feature_code":"PPLA","country_code":"US","admin1_id":4197000,"admin2_id":4196508,"timezone":"America/New_York","population":510823,"postcodes":["30301","30302","30303","30304","30305","30306","30307","30308","30309","30310","30311","30312","30313","30314","30315","30316","30317","30318","30320","30321","30324","30325","30326","30327","30328","30331","30332","30334","30336","30337","30338","30339","30342","30343","30344","30348","30349","30353","30354","30355","30357","30358","30361","30363","30364","30368","30369","30370","30371","30374","30375","30377","30378","30380","30384","30385","30388","30392","30394","30396","30398","31106","31107","31126","31131","31139","31150","31156","31192","31193","31195","31196","31136"],"country_id":6252001,"country":"United States","admin1":"Georgia","admin2":"Fulton"},{"id":2515275,"name":"Las Palas","latitude":37.66306,"longitude":-1.19032,"elevation":185.0,"feature_code":"PPL","country_code":"ES","admin1_id":2513413,"admin2_id":6355234,"admin3_id":6359526,"timezone":"Europe/Madrid","postcodes":["30334"],"country_id":2510769,"country":"Spain","admin1":"Murcia","admin2":"Murcia","admin3":"Fuente Álamo de Murcia"},{"id":2518291,"name":"El Palmeral","latitude":37.91536,"longitude":-1.20688,"elevation":113.0,"feature_code":"PPL","country_code":"ES","admin1_id":2513413,"admin2_id":6355234,"admin3_id":6362997,"timezone":"Europe/Madrid","postcodes":["30334"],"country_id":2510769,"country":"Spain","admin1":"Murcia","admin2":"Murcia","admin3":"Murcia Municipality"}],"generationtime_ms":0.28324127}

### Open Meteo Weather API
[Example Weather API URL](https://api.open-meteo.com/v1/forecast?latitude=33.749&longitude=-84.38798&daily=temperature_2m_max,temperature_2m_min&hourly=temperature_2m&models=gfs_seamless&current=temperature_2m,apparent_temperature&timezone=America%2FNew_York&forecast_days=1&wind_speed_unit=mph&precipitation_unit=inch&temperature_unit=fahrenheit)

### Weather results
{"latitude":33.759865,"longitude":-84.39587,"generationtime_ms":0.123500823974609,"utc_offset_seconds":-14400,"timezone":"America/New_York","timezone_abbreviation":"GMT-4","elevation":327,"current_units":{"time":"iso8601","interval":"seconds","temperature_2m":"°F","apparent_temperature":"°F"},"current":{"time":"2025-08-07T13:15","interval":900,"temperature_2m":75.4,"apparent_temperature":83.1},"hourly_units":{"time":"iso8601","temperature_2m":"°F"},"hourly":{"time":["2025-08-07T00:00","2025-08-07T01:00","2025-08-07T02:00","2025-08-07T03:00","2025-08-07T04:00","2025-08-07T05:00","2025-08-07T06:00","2025-08-07T07:00","2025-08-07T08:00","2025-08-07T09:00","2025-08-07T10:00","2025-08-07T11:00","2025-08-07T12:00","2025-08-07T13:00","2025-08-07T14:00","2025-08-07T15:00","2025-08-07T16:00","2025-08-07T17:00","2025-08-07T18:00","2025-08-07T19:00","2025-08-07T20:00","2025-08-07T21:00","2025-08-07T22:00","2025-08-07T23:00"],"temperature_2m":[71.2,70.7,70,69.4,69.6,70.8,69.6,69,69.3,70.3,71.6,72.2,72.3,74.5,77.2,78.7,79.7,79.2,79.2,78.1,75,72.4,71.2,70.5]},"daily_units":{"time":"iso8601","temperature_2m_max":"°F","temperature_2m_min":"°F"},"daily":{"time":["2025-08-07"],"temperature_2m_max":[79.7],"temperature_2m_min":[69]}}

### Rails new
rails new . --skip-action-mailer --skip-action-mailbox --skip-action-text --skip-active-record --skip-active-job --skip-active-storage --skip-action-cable --skip-solid --devcontainer

