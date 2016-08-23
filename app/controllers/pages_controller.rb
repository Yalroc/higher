class PagesController < ApplicationController
  skip_before_action :authenticate_candidate!, only: [ :home ]
  skip_before_action :authenticate_recruiter!, only: [ :home ]

  def home
  end
end
