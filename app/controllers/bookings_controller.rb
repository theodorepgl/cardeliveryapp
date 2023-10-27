class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = current_user.bookings.create(booking_params) 
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def edit
  end

  def update
  end

  private
  def booking_params
    params.require(:booking).permit(:car, :pickup_datetime, :pickup_location, :dropoff_location, :distance, :price)
  end
end
