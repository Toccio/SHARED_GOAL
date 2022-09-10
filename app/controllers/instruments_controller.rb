class InstrumentsController < ApplicationController
  # def index
  #   @lists = policy_scope(List).all
  #   @instruments = policy_scope(Instrument)
  # end

  def show
    @lists = policy_scope(List).all
    @instruments = policy_scope(Instrument)
    @instrument = policy_scope(Instrument).find([params[:id]])
    authorize @instruments
    if params[:query].present?
      @instruments = Instrument.global_search(params[:query])
    else
      @instruments = policy_scope(Instrument)
    end
  end
end
