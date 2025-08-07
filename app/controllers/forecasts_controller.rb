class ForecastsController < ApplicationController
  def show
    if !params[:address].blank?
      @location = Location.new(params[:address])
      @weather = Forecast.new(@location) if @location.valid?
    end
  end
end
