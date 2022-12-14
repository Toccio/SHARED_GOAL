class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:index, :show]

  include Pundit
  # include Pundit::Authorization

  # Pundit white-list approach
  after_action :verify_authorized, except: [:home, :index], unless: :skip_pundit?
  after_action :verify_policy_scoped, except: [:home, :index,:show, :new, :create], unless: :skip_pundit?

  # Uncomment when you *really understand* pundit
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #  flash[:alert] = “You are not authorized to perform this action.”
  #  redirect_to(root_path)
  # end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
