class Passenger::FlightsController < ApplicationController
  def create
    FlightPassenger.create(flight: Flight.find_by(flight_params), passenger: Passenger.find(params[:id]))
    redirect_to "/passengers/#{params[:id]}"
  end

  private
  def flight_params
    params.permit(:number)
  end
end
