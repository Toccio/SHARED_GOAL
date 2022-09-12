class InstrumentsController < ApplicationController
  # def index
  #   @lists = policy_scope(List).all
  #   @instruments = policy_scope(Instrument)
  # end
  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)

    if @instrument.save
      redirect_to @instrument, notice: 'Instrument added!'
    else
      render :new
    end
  end

  def show
    # @instrument = Instrument.new(instrument_params)

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

  private

  def instrument_params
    params.require(:instrument).permit(:name, :photo)
  end
end
