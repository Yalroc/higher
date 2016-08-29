  class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_candidate!, except: {controllers: [devise]}

  before_action :authenticate_candidate!, unless: :devise_controller?
  before_action :authenticate_recruiter!, unless: :devise_controller?

  include Pundit

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?


  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def current_user
    current_user = current_candidate || current_recruiter #pour messaging system
  end

  def user_not_authorized
    flash[:alert] = "It seems you are not authorized to perform this action...Sorry!"
    redirect_to(root_path)
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /^(active_)?admin/
  end

  def after_sign_in_path_for(resource)
    case resource.class.name # .name == .to_s
    when "Recruiter"
      job_offers_path
    when "Candidate"
      root_path
    end
  end
end
