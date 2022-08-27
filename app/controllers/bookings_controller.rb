class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :edit, :update, :destroy]
  # before_action :find_classroom, only: [:create, :new]

  def new
    @list = policy_scope(List).find(params[:list_id])
    @classroom = policy_scope(Classroom).find(params[:classroom_id])
    # authorize @classroom
    @booking = Booking.new
    authorize @booking
  end

  def create
    @list = policy_scope(List).find(params[:list_id])
    @classroom = policy_scope(Classroom).find(params[:classroom_id])
    @booking = Booking.new
    authorize @booking
    @booking.user = current_user
    @booking.classroom = @classroom
    if @booking.save!
      redirect_to list_classroom_bookings_path(@list, @classroom, @booking)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @booking.destroy
    # redirect_to booking_path
  end

  private

  def find_booking
    @booking = policy_scope(Booking).find(params[:id])
    authorize @booking
  end

  # def find_classroom
  #   @classroom = Classroom.find(params[:id])
  #   # authorize @classroom
  # end
end
