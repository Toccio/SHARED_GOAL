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
    # @instruments = policy_scope(Instrument).find(params[:id])
    # @instruments = @list.instruments
    authorize @list


    if params[:query].present?
      @lists = List.global_search(params[:query])
      # @list = policy_scope(List).find(params[:id])
    else
      @lists = policy_scope(List)
    end

    # if params[:query].present?
    #   @instruments = Instrument.global_search(params[:query])
    # else
    #   @instruments = policy_scope(instrument)
    # end
  end
end
