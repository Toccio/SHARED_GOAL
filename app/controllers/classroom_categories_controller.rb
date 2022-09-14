class ClassroomCategoriesController < ApplicationController
  def index
    @lists = policy_scope(List).all
    @classroom_categories = policy_scope(ClassroomCategory)
  end

  def show
    @lists = policy_scope(List).all
    # @instrument = policy_scope(Instrument).find(params[:instrument_id])
    # raise
    # @list = @instrument.list
    # @lists = policy_scope(List).all
    @classroom_categories = policy_scope(ClassroomCategory)
    @classroom_category = policy_scope(ClassroomCategory).find([params[:id]])
    authorize @classroom_categories
    authorize @classroom_category
    if params[:query].present?
      @classroom_categories = ClassroomCategory.global_search(params[:query])
    else
      @classroom_categories = policy_scope(ClassroomCategory)
    end
  end
end
