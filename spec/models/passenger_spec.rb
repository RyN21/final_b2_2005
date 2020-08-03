require 'rails_helper'

RSpec.describe Passenger do
  describe "Validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
  end

  describe 'Relationships' do
    it {should have_many :flight_passengers}
    it {should have_many(:flights).through(:flight_passengers)}
  end
end
