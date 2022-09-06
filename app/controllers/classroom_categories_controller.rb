class ClassroomCategoriesController < ApplicationController

  def index
    @classroom_categories = policy_scope(ClassroomCategory)
  end

  def show
    @classroom_categories = policy_scope(ClassroomCategory)
    authorize @classroom_categories
    if params[:query].present?
      @classroom_categories = ClassroomCategory.global_search(params[:query])
    else
      @classroom_categories = policy_scope(ClassroomCategory)
    end
  end
end
