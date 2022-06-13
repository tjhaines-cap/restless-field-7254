require 'rails_helper'

RSpec.describe "arilines show page" do

  before :each do
    @american = Airline.create!(name: "American")
    @delta = Airline.create!(name: "Delta")

    @flight_1 = @american.flights.create!(number: 7990, date: "2/7/2022", departure_city: "Glendale", arrival_city: "Dallas")
    @flight_2 = @american.flights.create!(number: 3940, date: "3/10/2022", departure_city: "Detroit", arrival_city: "Orlando")
    @flight_3 = @delta.flights.create!(number: 9091, date: "5/17/2022", departure_city: "Chicago", arrival_city: "Kansas City")

    @pass_1 = Passenger.create!(name: "Jane Powell", age: 18)
    @pass_2 = Passenger.create!(name: "John Smith", age: 30)
    @pass_3 = Passenger.create!(name: "Kathryn Grayson", age: 24)
    @pass_4 = Passenger.create!(name: "Kate Smith", age: 32)
    @pass_5 = Passenger.create!(name: "Shirley Temple", age: 8)

    FlightPassenger.create!(flight: @flight_1, passenger: @pass_1)
    FlightPassenger.create!(flight: @flight_1, passenger: @pass_2)
    FlightPassenger.create!(flight: @flight_2, passenger: @pass_3)
    FlightPassenger.create!(flight: @flight_3, passenger: @pass_4)
    FlightPassenger.create!(flight: @flight_1, passenger: @pass_5)
  end

  it "dispays unique list of adult passengers" do
    visit "/airlines/#{@american.id}"

    expect(page).to have_content("Jane Powell")
    expect(page).to have_content("John Smith")
    expect(page).to have_content("Kathryn Grayson")
    expect(page).to_not have_content("Shirley Temple")
    expect(page).to_not have_content("Kate Smith")
  end
end