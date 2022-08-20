class ListsController < ApplicationController
  before_action :find_params, only: [:show, :edit, :update, :destroy]
  def edit
    find_params
  end

  def update
    find_params
    @list.update(set_params)
    redirect_to show-action-route-prefix-here_path(@var)
  end

  def destroy
    find_params
    @list.destroy
    redirect_to index-action-route-prefix-here_path
  end

  private

  def find_params
    @list = List.find(params[:id])
  end

  def set_params
    params.require(:list).permit(:name, :description)
  end
end
