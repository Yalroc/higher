class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_candidate!, except: {controllers: [devise]}

  before_action :authenticate_candidate!, unless: :devise_controller?
  before_action :authenticate_recruiter!, unless: :devise_controller?
end

# Solution 1
#   before_action :authenticate_candidate!, unless: :devise_controller?
#   before_action :authenticate_recruiter!, unless: :devise_controller?
# Dans les controller skip_before_action :authenticate_recruiter (quand on est sur une action candidat)
