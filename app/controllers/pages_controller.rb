class PagesController < ApplicationController
  skip_before_action :authenticate_candidate!, only: [ :home, :demo, :search ]
  skip_before_action :authenticate_recruiter!, only: [ :home, :demo, :search ]
  skip_after_action  :verify_authorized

  def home
  end

  def demo  # demo job offer
    @job_offer = JobOffer.find(1)
  end

  def search
    @job_offers = JobOffer.all # later Algolia search stuff features
  end

end
