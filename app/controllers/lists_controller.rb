class ListsController < ApplicationController
  def index
    if params[:query].present?
      @lists = List.global_search(params[:query])
    else
      @lists = policy_scope(List)
    end
  end

  def show
    @list = policy_scope(List).find(params[:id])
    @classroom_categories = @list.classroom_categories
    authorize @list
  end
end
