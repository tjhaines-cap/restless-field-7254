class Airline < ApplicationRecord
  has_many :flights

  def adult_passengers
    flights.joins(:passengers)
           .where("passengers.age > 17")
           .pluck("passengers.name")
  end
end