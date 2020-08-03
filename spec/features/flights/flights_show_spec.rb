require 'rails_helper'

RSpec.describe "Flights Show Page" do
  before :each do
    @frontier = Airline.create(name: "Frontier")
    @flight_1 = @frontier.flights.create(number: "1727", date: "08/03/20", time: "10:00", departure_city: "Denver", arrival_city: "Reno")
    @joe      = Passenger.create(name: "Joe", age: 7)
    @ron      = Passenger.create(name: "Ron", age: 5)
    @olivia   = Passenger.create(name: "Olivia", age: 25)
    @reija    = Passenger.create(name: "Reija", age: 7)

    FlightPassenger.create(flight: @flight_1, passenger: @joe)
    FlightPassenger.create(flight: @flight_1, passenger: @ron)
    FlightPassenger.create(flight: @flight_1, passenger: @olivia)
    FlightPassenger.create(flight: @flight_1, passenger: @reija)

    visit "/flights/#{@flight_1.id}"
  end

  it "has flight info" do
    expect(page).to have_content(@flight_1.number)
    expect(page).to have_content(@flight_1.date)
    expect(page).to have_content(@flight_1.time)
    expect(page).to have_content(@flight_1.departure_city)
    expect(page).to have_content(@flight_1.arrival_city)
  end

  it "has the name of the airline it belongs to" do
    expect(page).to have_content("Frontier")
  end

  it "has the names of all the passengers on the flight" do
    expect(page).to have_content(@joe.name)
    expect(page).to have_content(@ron.name)
    expect(page).to have_content(@olivia.name)
    expect(page).to have_content(@reija.name)
  end

  it "Count of minors and adults on flight" do
    expect(page).to have_content("Number of Adults: 1")
    expect(page).to have_content("Number of minors: 3")
  end
end





I see the number of minors on the flight (minors are any passengers that are under 18)
And I see the number of adults on the flight (adults are any passengers that are 18 or older)
```
