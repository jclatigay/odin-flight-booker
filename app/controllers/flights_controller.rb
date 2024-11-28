class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |airport| [ "#{airport.code}", airport.id ] }
    @flight_dates = Flight.order(:start).pluck(:start).map(&:to_date).uniq

    @flights = Flight.all

    if params[:departure_airport_id].present?
      @flights = @flights.where(departure_airport_id: params[:departure_airport_id])
    end

    if params[:arrival_airport_id].present?
      @flights = @flights.where(arrival_airport_id: params[:arrival_airport_id])
    end

    if params[:start].present?
      date = Date.parse(params[:start])
      @flights = @flights.where("DATE(start) = ?", date)
    end
  end
end
