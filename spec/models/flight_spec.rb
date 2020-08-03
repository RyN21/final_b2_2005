require 'rails_helper'

RSpec.describe Flight do
  describe 'Validations' do
    it {should validate_presence_of :number}
    it {should validate_presence_of :date}
    it {should validate_presence_of :time}
    it {should validate_presence_of :departure_city}
    it {should validate_presence_of :arrival_city}
  end

  describe 'Relationships' do
    it {should belong_to :airline}
    it {should have_many :flight_passengers}
    it {should have_many(:passengers).through(:flight_passengers)}
  end

  describe 'Methods' do
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
    end
    it "#count_of_adults" do
      expect(@flight_1.count_of_adults).to eq(1)
    end

    it "#count_of_minors" do
      expect(@flight_1.count_of_minors).to eq(3)
    end
  end
end
