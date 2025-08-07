# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version  
3.3.8

* Rails version  
8.0.2

## considerations
- no database; YAGNI
- neither of the API's used require a key
- address parsing is simple as accurate parsing of addresses is not trivial
- uses the zipcode from the address for geocoding which is close enough for getting weather data
 - Geocoding is currently hardwired to the US.
## Models
- Location: responsible for geocoding the provided addess and storing the geolocation data
- Forecast: uses data from a Location instance to retrieve and store weather data
ActiveModel was used to allow for validations on the models.

## testing
- `rspec` to run the tests
- Both models are covered by tests
- needs tests for the Geocoder and WeatherForecast modules

## To Do- this was timeboxed to three hours
- needs more tests
- Need to DRY up the GEocoder and WeatherForecast modules,
- better error/exception handling
- more logging
- some styling



