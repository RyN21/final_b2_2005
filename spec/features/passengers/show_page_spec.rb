require 'rails_helper'

RSpec.describe "Passenger Show Page" do
  before :each do
    @frontier = Airline.create(name: "Frontier")
    @flight_1 = @frontier.flights.create(number: "1727", date: "08/03/20", time: "10:00", departure_city: "Denver", arrival_city: "Reno")
    @flight_2 = @frontier.flights.create(number: "1827", date: "08/03/20", time: "8:00", departure_city: "Denver", arrival_city: "Reno")
    @joe      = Passenger.create(name: "Joe", age: 7)
    @ron      = Passenger.create(name: "Ron", age: 7)
    @olivia   = Passenger.create(name: "Olivia", age: 7)
    @reija    = Passenger.create(name: "Reija", age: 7)

    FlightPassenger.create(flight: @flight_1, passenger: @joe)
    FlightPassenger.create(flight: @flight_1, passenger: @ron)
    FlightPassenger.create(flight: @flight_1, passenger: @olivia)
    FlightPassenger.create(flight: @flight_2, passenger: @olivia)
    FlightPassenger.create(flight: @flight_1, passenger: @reija)

    visit "/passengers/#{@olivia.id}"
    save_and_open_page
  end

  it "has passengers info" do
    expect(page).to have_link("1727")
    expect(page).to have_link("1827")
  end
end
