class PagesController < ApplicationController
  skip_before_action :authenticate_candidate!, only: [ :home, :demo ]
  skip_before_action :authenticate_recruiter!, only: [ :home, :demo ]
  skip_after_action  :verify_authorized

  def home
  end

  def demo  # demo job offer
  end

end
