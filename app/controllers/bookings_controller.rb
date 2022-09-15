class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :edit, :update, :destroy, :decline, :accept]

  def new
    @list = policy_scope(List).find(params[:list_id])
    @classroom = policy_scope(Classroom).find(params[:classroom_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @classroom = policy_scope(Classroom).find(params[:classroom_id])
    @booking = Booking.new
    authorize @booking
    @booking.user = current_user
    @booking.classroom = @classroom
    if @booking.save!
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @booking.update(set_params)
    redirect_to list_classroom_bookings_path(@list, @classroom, @booking)
  end

  def accept
    @booking.accepted!
    redirect_to user_path(current_user)
  end

  def decline
    @booking.rejected!
    redirect_to user_path(current_user)
  end

  def destroy
    @booking.destroy
  end

  private

  def find_booking
    @booking = policy_scope(Booking).find(params[:id])
    authorize @booking

  end

  def set_params
    params.require(:booking).permit(:status)
  end
end
