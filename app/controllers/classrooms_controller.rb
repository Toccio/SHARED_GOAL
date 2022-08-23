class ClassroomsController < ApplicationController
  before_action :find_params, only: [:show, :edit, :update, :destroy]

  def index
    @classrooms = Classroom.all
    # @classrooms = policy_scope(Classroom)
  end

  def show
  end

  def new
    @list = List.find(params[:list_id])
    @classroom = Classroom.new
  end

  def create
    @list = List.find(params[:list_id])
    @classroom = Classroom.new(set_params)
    @classroom.user = current_user
    @classroom.list = @list
    # @classroom.user = @user
    # @classroom.list = @list
    if @classroom.save
      redirect_to list_classroom_path(@classroom)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @classroom.update(set_params)
    redirect_to classroom_path(@classroom)
  end

  def destroy
    @classroom.destroy
    redirect_to classrooms_path
  end

  private

  def find_params
    @classroom = Classroom.find(params[:id])
    # authorize @classroom
  end

  def set_params
    params.require(:classroom).permit(:name, :description, :start_date, :end_date, :max_number_participants, :level, :language, :time, :address)
  end
end
