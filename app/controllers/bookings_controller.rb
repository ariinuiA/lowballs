class BookingsController < ApplicationController
  before_action :set_item, only: %i[new create]
  before_action :set_booking, only: %i[edit update]

  def my_bookings

  end

  def my_rented_items
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.item = @item

    if @booking.save
      redirect_to root_path, notice: "Booking request submitted!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to root_path(@booking)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def booking_params
    params.require(:booking).permit(:status, :item_id, :booking_date, :return_date)
  end
end
