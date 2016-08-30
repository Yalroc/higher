module ApplicationHelper
  def current_user
    current_user = current_candidate || current_recruiter #pour messaging system
  end
end
