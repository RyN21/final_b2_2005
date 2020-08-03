class FlightsController < ApplicationController
  def show
    @flight = Flight.find(params[:id])
    @passengers = @flight.passengers
  end
end
