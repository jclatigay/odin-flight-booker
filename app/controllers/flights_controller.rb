class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.map { |airport| [ "#{airport.code}", airport.id ] }
    @flight_dates = Flight.order(:start).pluck(:start).map(&:to_date).uniq

    @flights = Flight.all
    @flights = apply_filters(@flights)
    @flights = @flights.order(sort_column => sort_direction)
  end

  private

  def apply_filters(flights)
    flights = flights.where(departure_airport_id: params[:departure_airport_id]) if params[:departure_airport_id].present?
    flights = flights.where(arrival_airport_id: params[:arrival_airport_id]) if params[:arrival_airport_id].present?
    flights = flights.where("DATE(start) = ?", Date.parse(params[:start])) if params[:start].present?
    flights
  end

  def sort_column
    %w[start duration].include?(params[:sort]) ? params[:sort] : "start"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
