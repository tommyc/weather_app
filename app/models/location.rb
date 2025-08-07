class Location
  include ActiveModel::Attributes
  include ActiveModel::AttributeAssignment
  include ActiveModel::AttributeMethods
  include ActiveModel::Serialization
  include ActiveModel::Conversion
  include ActiveModel::Validations
  include AddressParser
  include Geocoder

  define_attribute_methods :address, :zipcode, :latitude, :longitude, :timezone
  attr_accessor :address, :zipcode, :latitude, :longitude, :timezone

  attribute :address, :string
  attribute :zipcode, :string
  attribute :latitude, :float
  attribute :longitude, :float
  attribute :timezone, :string


  validates :address, :zipcode, :latitude, :longitude, presence: true

  def initialize(addr)
    @address = addr
    @zipcode = extract_zipcode(addr)
    # location = geocode(self)
    geocode(self)
  end

  # def to_hash
  #   instance_values.symbolize_keys
  # end

  def attributes
    { "address" => @address, "zipcode" => @zipcode, "latitude" => @latitude, "longitude" => @longitude, "timezone" => @timezone }
  end
end
