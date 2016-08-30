module ApplicationHelper
  def current_user
    current_user = current_candidate || current_recruiter #pour messaging system
  end #pour pouvoir les utiliser dans la navbar car on ne peut pas utiliser dans la view
end
