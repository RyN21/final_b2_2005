require 'rails_helper'

RSpec.describe Airline do
  describe 'Validations' do
    it {should validate_presence_of :name}
  end

  describe 'Relationships' do
    it {should have_many :flights}
  end
end
