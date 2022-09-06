class ClassroomsController < ApplicationController
  before_action :find_params, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @classrooms = Classroom.search_by_name_and_description(params[:query])
    else
      @classrooms = policy_scope(Classroom)
    end
  end

  def show
  end

  def new
    @classroom_category = ClassroomCategory.find(params[:classroom_category_id])
    @classroom = Classroom.new
    authorize @classroom
  end

  def create
    @classroom_category = ClassroomCategory.find(params[:classroom_category_id])
    @classroom = Classroom.new(set_params)
    @classroom.user = current_user
    @classroom.classroom_category = @classroom_category
    if @classroom.save!
      redirect_to classroom_category_classrooms_path(@classroom_category)
    else
      render :new
    end
    authorize @classroom
  end

  def edit
  end

  def update
    @classroom.update(set_params)
    redirect_to list_classroom_path(@list, @classroom)
  end

  def destroy
    @classroom.destroy
    redirect_to list_classrooms_path(@list)
  end

  private

  def find_params
    @classroom = policy_scope(Classroom).find(params[:id])
    authorize @classroom
  end

  def set_params
    params.require(:classroom).permit(:name, :description, :category, :start_date, :end_date, :max_number_participants,:level, :language, :time, :address, :photo)
  end
end
