class BookingsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @bookings = current_user.bookings.all
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = current_user.bookings.new(booking_params)
    
    if @booking.save
      flash[:success] = "New booking added!"
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
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
