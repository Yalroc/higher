class PagesController < ApplicationController
  skip_before_action :authenticate_candidate!, only: [ :home ]

  def home
  end
end
