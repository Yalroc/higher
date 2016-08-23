class JobApplicationsController < ApplicationController
  before_action :set_job_offer, only: [:edit, :update]
  before_action :set_job_application, only: [:update]


  def edit
    # SELECT @job_application
    # Check IF a job application already exists
    if JobApplication.where(job_offer: @job_offer, candidate: current_candidate)
      # a job application already exists
      @job_application = JobApplication.where(job_offer: @job_offer, candidate: current_candidate)

    else
      # a job application does not existe => Create new job_application
      @job_application = JobApplication.new
      @job_application.candidate = current_candidate
      @job_application.job_offer = @job_offer
      @job_application.save
    end

    @experiences_sorted = current_candidate.experiences.sort! { |a,b| b.end_date <=> a.end_date }
    @educations_sorted = current_candidate.educations.sort! { |a,b| b.end_date <=> a.end_date }
    @languages = current_candidate.languages
  end

  def update
    if @job_application.update(job_application_params)
      # TODO: make 'view as employer clickable'
      redirect_to edit_job_offer_job_application(@job_offer, @job_application)
    else
      render :edit
    end
  end

  private

  def job_application_params
    params.require(:job_application).permit(:motivation_letter)
  end

  def set_job_offer
    @job_offer = JobOffer.find(params[:job_offer_id])
  end

  def set_job_application
    @set_job_application = JobApplication.find(params[:id])
  end

end

