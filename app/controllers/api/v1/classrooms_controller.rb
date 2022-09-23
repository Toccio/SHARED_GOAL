class Api::V1::ClassroomsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_classroom, only: [:show, :update, :destroy]

  def index
    @classrooms = policy_scope(Classroom)
  end

  def show
  end

  def update
    if @classroom.update(classroom_params)
      render :show
    else
      render_error
    end
  end

  def create
    @classroom = Classroom.new(classroom_params)
    @classroom.user = current_user
    authorize @classroom
    if @classroom.save
      render :show, status: :created
    else
      render_error
    end
  end

  def destroy
    @classroom.destroy
    head :no_content
    # No need to create a `destroy.json.jbuilder` view
  end
  private

  def set_classroom
    @classroom = Classroom.find(params[:id])
    authorize @classroom  # For Pundit
  end

  def classroom_params
    params.require(:classroom).permit(:name, :description, :level, :photo, :category)
  end

  def render_error
    render json: { errors: @classroom.errors.full_messages },
      status: :unprocessable_entity
  end
end
