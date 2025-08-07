class Forecast
include ActiveModel::Attributes
  include ActiveModel::AttributeAssignment
  include ActiveModel::AttributeMethods
  include ActiveModel::Serialization
  include ActiveModel::Conversion
  include ActiveModel::Validations
  include WeatherForecast

  define_attribute_methods :address, :current_temp, :min_temp, :max_temp, :humidity

  attr_accessor :address, :current_temp, :min_temp, :max_temp, :humidity

  attribute :address, :string
  attribute :current_temp, :float
  attribute :min_temp, :float
  attribute :max_temp, :float
  attribute :humidity, :integer

  # validates :address, :current_temp, :min_temp, :max_temp, presence: true

  def initialize(location)
    @address = location.address
    if location.valid?
      get_weather(location, self)
    end
  end
  def attributes
    { "address" => @address, "current_temp" => @current_temp, "min_temp" => @min_temp, "max_temp" => @max_temp, "humidity" => @humidity, "timezone" => @timezone }
  end
end
