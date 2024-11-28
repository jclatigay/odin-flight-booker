class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @booking = Booking.new(flight: @flight)
    @passenger_count = params[:num_passengers].to_i
    @passenger_count.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to @booking, notice: "Booking was successfully created."
    else
      @flight = Flight.find(booking_params[:flight_id])
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(
      :flight_id,
      passengers_attributes: [ :name, :email ]
    )
  end
end
