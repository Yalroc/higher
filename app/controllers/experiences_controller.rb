class ExperiencesController < ApplicationController
  skip_before_action :authenticate_recruiter!

  def new
    @experience = Experience.new
    authorize @experience
  end

  def create
    @experience = Experience.new(experience_params)
    authorize @experience
    @experience.save

    # redirection to same page
    @job_application = JobApplication.find(params[:experience][:job_application_id])
    @job_offer = @job_application.job_offer
    redirect_to edit_job_offer_job_application_path(@job_offer, @job_application)
  end

  def edit
    @experience = Experience.find(params[:id])
    authorize @experience
  end

  def update
    @experience = Experience.find(params[:id])
    authorize @experience
    @experience.update(experience_params)

    # redirection to same page
    @job_application = @experience.job_application
    @job_offer = @job_application.job_offer
    redirect_to edit_job_offer_job_application_path(@job_offer, @job_application)
  end

  def destroy
    @experience = Experience.find(params[:id])
    @job_application = @experience.job_application # need job_application for redirection belowd
    authorize @experience
    @experience.destroy

    # redirection to same page
    # @job_application => found above through @experience, before we destroy it
    @job_offer = @job_application.job_offer
    redirect_to edit_job_offer_job_application_path(@job_offer, @job_application)
  end

  private

  def pundit_user
    current_candidate
  end

  def experience_params
    params.require(:experience).permit(:title, :organization, :start_date, :end_date, :present, :description, :company_size, :industry, :job_application_id)
  end
end
