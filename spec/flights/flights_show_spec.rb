require 'rails_helper'

RSpec.describe "Flights Show Page" do
  before :each do
    @frontier = Airline.create(name: "Frontier")
    @flight_1 = @frontier.flights.create(number: "1727", date: "08/03/20", time: "10:00", departure_city: "Denver", arrival_city: "Reno")
    @joe      = Passenger.create(name: "Joe", age: 7)
    @ron      = Passenger.create(name: "Ron", age: 7)
    @olivia   = Passenger.create(name: "Olivia", age: 7)
    @reija    = Passenger.create(name: "Reija", age: 7)

    @fligh_passengers1 = FlightPassengers.create(flight: @flight_1, passenger: @joe)
    @fligh_passengers2 = FlightPassengers.create(flight: @flight_1, passenger: @ron)
    @fligh_passengers3 = FlightPassengers.create(flight: @flight_1, passenger: @olivia)
    @fligh_passengers4 = FlightPassengers.create(flight: @flight_1, passenger: @reija)

    visit "/flights/#{@flight_1.id}"
  end

  it "text" do
    expect(page).to have_content(@flight_1.number)
    expect(page).to have_content(@flight_1.date)
    expect(page).to have_content(@flight_1.time)
    expect(page).to have_content(@flight_1.departure_city)
    expect(page).to have_content(@flight_1.arrival_city)
  end

  # it "has the name of the airline it belongs to" do
  #   expect(page).to have_content("Frontier")
  # end
  #
  # it "has the names of all the passengers on the flight" do
  #   expect(page).to have_content(@joe.name)
  #   expect(page).to have_content(@ron.name)
  #   expect(page).to have_content(@olivia.name)
  #   expect(page).to have_content(@reija.name)
  # end
end
