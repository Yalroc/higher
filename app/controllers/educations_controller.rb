class EducationsController < ApplicationController
  skip_before_action :authenticate_recruiter!

  def new
    @education = Education.new
    authorize @education
  end

  def create
    @education = Education.new(education_params)
    authorize @education
    @education.save

    # redirection to same page
    @job_application = JobApplication.find(params[:education][:job_application_id])
    @job_offer = @job_application.job_offer
    redirect_to edit_job_offer_job_application_path(@job_offer, @job_application)
  end

  def edit
    @education = Education.find(params[:id])
    authorize @education
  end

  def update
    @education = Education.find(params[:id])
    authorize @education
    @education.update(education_params)

    # redirection to same page
    @job_application = @education.job_application
    @job_offer = @job_application.job_offer
    redirect_to edit_job_offer_job_application_path(@job_offer, @job_application)
  end

  def destroy
    @education = Education.find(params[:id])
    @job_application = @education.job_application # need job_application for redirection belowd
    authorize @education
    @education.destroy

    # redirection to same page
    # @job_application => found above through @education, before we destroy it
    @job_offer = @job_application.job_offer
    redirect_to edit_job_offer_job_application_path(@job_offer, @job_application)
  end

  private

  def pundit_user
    current_candidate
  end

  def education_params
    params.require(:education).permit(:degree_type, :degree_field, :organization, :start_date, :end_date, :description, :job_application_id)
  end
end
