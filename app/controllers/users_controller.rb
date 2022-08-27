class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @classrooms = current_user.classrooms.includes(:bookings)

  end
end
