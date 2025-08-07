require 'rails_helper'

describe Forecast do
  let(:location) { double("Location", address: "206 Washington Street, SW, Atlanta, Georgia, 30334", valid?: true) }
  let(:weather) do
    {
      current_temp: 72.5,
      min_temp: 75.0,
      max_temp: 87.0,
      humidity: 55,
      timezone: "America/New_York"
    }
  end

  before do
    allow_any_instance_of(Forecast).to receive(:get_weather) do |obj|
      obj.current_temp = weather[:current_temp]
      obj.min_temp = weather[:min_temp]
      obj.max_temp = weather[:max_temp]
      obj.humidity = weather[:humidity]
      obj.instance_variable_set(:@timezone, weather[:timezone])
    end
  end

  describe "#initialize" do
    it "sets address from location" do
      forecast = Forecast.new(location)
      expect(forecast.address).to eq("206 Washington Street, SW, Atlanta, Georgia, 30334")
    end

    it "calls get_weather when location is valid" do
      expect_any_instance_of(Forecast).to receive(:get_weather).with(location, kind_of(Forecast))
      Forecast.new(location)
    end

    it "sets weather attributes from get_weather" do
      forecast = Forecast.new(location)
      expect(forecast.current_temp).to eq(weather[:current_temp])
      expect(forecast.min_temp).to eq(weather[:min_temp])
      expect(forecast.max_temp).to eq(weather[:max_temp])
      expect(forecast.humidity).to eq(weather[:humidity])
    end
  end

  describe "#attributes" do
    it "return model attributes as a hash" do
      forecast = Forecast.new(location)
      expected = {
        "address" => "206 Washington Street, SW, Atlanta, Georgia, 30334",
        "current_temp" => weather[:current_temp],
        "min_temp" => weather[:min_temp],
        "max_temp" => weather[:max_temp],
        "humidity" => weather[:humidity],
        "timezone" => weather[:timezone]
      }
      expect(forecast.attributes).to eq(expected)
    end
  end

  context "when location is not valid" do
    let(:invalid_location) { double("Location", address: "206 Washington Street, SW, Atlanta, Georgia, 30334", valid?: false) }

    it "does not call get_weather" do
      expect_any_instance_of(Forecast).not_to receive(:get_weather)
      Forecast.new(invalid_location)
    end
  end
end
