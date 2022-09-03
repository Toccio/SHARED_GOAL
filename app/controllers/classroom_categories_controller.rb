class ClassroomCategoriesController < ApplicationController

  def index
    @classroom_categories = policy_scope(ClassroomCategory)

    @list = policy_scope(List).find(params[:list_id])

    # if params[:query].present?
    #   @classroom_categories = Classroom_categories.global_search(params[:query])
    # else
    #   @classroom_categories = policy_scope(Classroom_categories)
    # end
  end

  def show
    @classroom_category = policy_scope(ClassroomCategory).find(params[:id])
    @classrooms = @classroom_category.classroom
    authorize @classroom_category
  end

end
