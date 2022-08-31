class UsersController < ApplicationController
  def show
    @user = policy_scope(User).find(params[:id])
    authorize @user
    @classrooms = current_user.classrooms.includes(:bookings)
    @out_bookings = current_user.bookings
  end
end
