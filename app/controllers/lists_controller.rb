class ListsController < ApplicationController
  before_action :find_params, only: [:show, :edit, :update, :destroy]


  def index
    @list = List.all
  end

  def show
  end

  def new
    @list = List.new
    # authorize @list
  end

  def create
    @list = List.new(set_params)
#     @list.user = current_user
    # authorize @list
      if @list.save
        redirect_to list_path(@list), notice: 'The list was successfully created!'
      else
        render :new
      end
      
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
