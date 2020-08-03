class Passenger::FlightsController < ApplicationController
  def create
    flight = Flight.find_by(flight_params)
    passenger = Passenger.find(params[:id])
    FlightPassenger.create(flight: flight, passenger: passenger)
    redirect_to "/passengers/#{passenger.id}"
  end

  private
  def flight_params
    params.permit(:number)
  end
end
