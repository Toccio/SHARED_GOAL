class ClassroomsController < ApplicationController
  before_action :find_params, only: [:show, :edit, :update, :destroy]

  def index
    @classrooms = policy_scope(Classroom)
    @list = policy_scope(List).find(params[:list_id])
    # if params[:query].present?
    #   @classrooms = Classroom.search(params[:query])
    # else
    #   @classrooms = Classroom.all
    # end
  end

  def show
  end

  def new
    #@list = List.find(params[:list_id])
    @list = policy_scope(List).find(params[:list_id])
    @classroom = Classroom.new
    authorize @classroom
    # @classroom.user = current_user
  end

  def create
    @list = policy_scope(List).find(params[:list_id])
    @classroom = Classroom.new(set_params)
    authorize @classroom
    @classroom.user = current_user
    @classroom.list = @list
    if @classroom.save
      redirect_to list_classroom_path(@list, @classroom)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @classroom.update(set_params)
    @list = @classroom.list
    redirect_to list_classroom_path(@list, @classroom)
  end

  def destroy
    @classroom = policy_scope(Classroom).find(params[:id])
    @list = @classroom.list
    @classroom.destroy
    redirect_to list_classrooms_path(@list)
  end

  private

  def find_params
    @classroom = policy_scope(Classroom).find(params[:id])
    authorize @classroom
  end

  def set_params
    params.require(:classroom).permit(:name, :description, :category, :start_date, :end_date, :max_number_participants,
                                      :level, :language, :time, :address, :photo)
  end
end
