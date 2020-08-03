class Flight < ApplicationRecord
  belongs_to :airline

  validates_presence_of :number,
                        :date,
                        :time,
                        :departure_city,
                        :arrival_city
end
