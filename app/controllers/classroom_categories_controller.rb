class ClassroomCategoriesController < ApplicationController

  def index
    # @list = policy_scope(List).find(params[:list_id])
    @classroom_categories = policy_scope(ClassroomCategory)


    # if params[:query].present?
    #   @classroom_categories = Classroom_categories.global_search(params[:query])
    # else
    #   @classroom_categories = policy_scope(Classroom_categories)
    # end
  end

  def show
    # @classroom_category = policy_scope(ClassroomCategory).find(params[:id])
    # @classrooms = @classroom_category.classroom
    @classroom_categories = policy_scope(ClassroomCategory)
    authorize @classroom_categories

    if params[:query].present?
      @classroom_category = ClassroomCategory.global_search(params[:query])
    else
      @classroom_category = policy_scope(ClassroomCategory)
    end



  end


end
