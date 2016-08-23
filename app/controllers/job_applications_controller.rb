class JobApplicationsController < ApplicationController
  before_action :set_job_offer, only: [:index, :edit, :update]
  before_action :set_job_application, only: [:update]

  skip_before_action :authenticate_candidate!



  def index
    @job_applications = set_job_offer.job_applications
  end

  def edit
    # SELECT @job_application
    # Check IF a job application already exists
    if JobApplication.where(job_offer: @job_offer, candidate: current_candidate)
      # a job application already exists
      @job_application = JobApplication.where(job_offer: @job_offer, candidate: current_candidate).first

    else
      # a job application does not existe => Create new job_application
      @job_application = JobApplication.new # =>  <# JobApplication 358742, candidate: nil, job_offer: nil, motivation_letter: nil >
      @job_application.candidate = current_candidate
      @job_application.job_offer = @job_offer
      @job_application.save
    end

    @experiences_sorted = @job_application.experiences.sort { |a,b| b.end_date <=> a.end_date }
    @educations_sorted = @job_application.educations.sort { |a,b| b.end_date <=> a.end_date }
    @languages = @job_application.languages
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
    @job_application = JobApplication.find(params[:id])
  end

end

