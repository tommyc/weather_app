require 'rails_helper'

RSpec.describe Location do
  let(:address) { "206 Washington Street, SW, Atlanta, Georgia, 30334" }
  let(:zipcode) { "30334" }
  let(:latitude) { 33.749 }
  let(:longitude) { -84.38798 }
  let(:timezone) { "America/New_York" }

  before do
    allow_any_instance_of(Location).to receive(:extract_zipcode).and_return(zipcode)
    allow_any_instance_of(Location).to receive(:geocode) do |inst|
      inst.latitude = latitude
      inst.longitude = longitude
      inst.timezone = timezone
    end
  end

  describe "#initialize" do
    it "sets address and zipcode" do
      location = Location.new(address)
      expect(location.address).to eq(address)
      expect(location.zipcode).to eq(zipcode)
    end

    it "calls geocode to set location attributes" do
      location = Location.new(address)
      expect(location.latitude).to eq(latitude)
      expect(location.longitude).to eq(longitude)
      expect(location.timezone).to eq(timezone)
    end
  end

  describe "validations" do
    it "is valid with all required attributes" do
      location = Location.new(address)
      location.latitude = latitude
      location.longitude = longitude
      expect(location).to be_valid
    end

    it "is not valid if address is nil" do
      location = Location.new(nil)
      location.latitude = latitude
      location.longitude = longitude
      expect(location).not_to be_valid
      expect(location.errors[:address]).to be_present
    end

    it "is not valid if zipcode is nil" do
      allow_any_instance_of(Location).to receive(:extract_zipcode).and_return(nil)
      location = Location.new(address)
      location.latitude = latitude
      location.longitude = longitude
      expect(location).not_to be_valid
      expect(location.errors[:zipcode]).to be_present
    end

    it "is not valid if latitude is nil" do
      location = Location.new(address)
      location.latitude = nil
      location.longitude = longitude
      expect(location).not_to be_valid
      expect(location.errors[:latitude]).to be_present
    end

    it "is not valid if longitude is nil" do
      location = Location.new(address)
      location.latitude = latitude
      location.longitude = nil
      expect(location).not_to be_valid
      expect(location.errors[:longitude]).to be_present
    end
  end

  describe "#attributes" do
    it "returns attributes as a hash" do
      location = Location.new(address)
      expected = {
        "address" => address,
        "zipcode" => zipcode,
        "latitude" => latitude,
        "longitude" => longitude,
        "timezone" => timezone
      }
      expect(location.attributes).to eq(expected)
    end
  end
end
