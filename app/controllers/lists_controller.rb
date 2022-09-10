class ListsController < ApplicationController
  def index
    # if params[:notice].present?
    #   notice = "Your request has been successful"
    # end
    #raise
    # @list = policy_scope(List).find(params[:id])
    if params[:query].present?
      @lists = List.global_search(params[:query])
      @list = policy_scope(List).find(params[:id])
    else
      @lists = policy_scope(List)
    end
  end

  def show
    @lists = policy_scope(List).all
    @list = policy_scope(List).find(params[:id])
    @classroom_categories = policy_scope(ClassroomCategory).find(params[:id])
    @classroom_categories = @list.classroom_categories
    authorize @list

    if params[:query].present?
      @classroom_categories = ClassroomCategory.global_search(params[:query])
    else
      @classroom_categories = policy_scope(ClassroomCategory)
    end
  end
end
