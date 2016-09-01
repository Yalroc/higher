class PagesController < ApplicationController
  skip_before_action :authenticate_candidate!, only: [ :home, :demo, :search ]
  skip_before_action :authenticate_recruiter!, only: [ :home, :demo, :search ]
  skip_after_action  :verify_authorized

  def home
    # if recruiter_signed_in?
    #   @job_offers = JobOffer.where(recruiter: current_recruiter)
    #   @job_offer_for_navbar = JobOffer.where(recruiter: current_recruiter).first
    #   @job_applications = @job_offer_for_navbar.job_applications
    # end
  end

  def demo  # demo job offer
    @job_offer = JobOffer.find(1)
  end

  def search
    @job_offers = JobOffer.all # later Algolia search stuff features
  end

end
