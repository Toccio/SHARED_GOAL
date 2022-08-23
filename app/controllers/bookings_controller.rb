class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :edit, :update, :destroy]
  # before_action :find_classroom, only: [:create, :new]
  def index
    @bookings = current_user.classrooms
    @booking = policy_scope(Classroom)
  end

  def new
    @classroom = Classroom.find(params[:classroom_id])
    # authorize @classroom
    @booking = Booking.new
  end

  def create
    @classroom = Classroom.find(params[:classroom_id])
    @booking = Booking.new
    @booking.classroom = @classroom
    @booking.user = current_user
    if @booking.save
      # redirect_to reservations_path
      redirect_to booking_path(@booking)
    else
      render :new
    end
    # authorize @booking
  end

  def show
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  # def find_classroom
  #   @classroom = Classroom.find(params[:id])
  #   # authorize @classroom
  # end

end
