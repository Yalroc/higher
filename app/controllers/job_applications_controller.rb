class JobApplicationsController < ApplicationController

  def edit
    # find current job_offer
    @job_offer = JobOffer.find(params[:job_offer_id])

    # check if job_application already exists
    if JobApplication.where(job_offer: @job_offer, candidate: current_candidate)

    else
    # Create job_application instance
    @job_application = JobApplication.new
    @job_application.candidate = current_candidate
    @job_application.job_offer = @job_offer
    @job_application.save
    end
  end

end

