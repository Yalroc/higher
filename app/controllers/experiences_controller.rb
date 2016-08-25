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
    @job_application = JobApplication.find(params[:experience][:job_application_id])
    @job_offer = @job_application.job_offer
    redirect_to edit_job_offer_job_application_path(@job_offer, @job_application)
  end

  def edit
    @job = current_user
    @experience = Experience.find(params[:id])
  end

  def update
    @user = current_user
    @experience = Experience.find(params[:id])
    @experience.update(experience_params)
    redirect_to candidate_path(current_user)
  end

  def destroy
    @experience = Experience.find(params[:id])
    @experience.destroy
    redirect_to user_path(current_user)
  end

  private

  def pundit_user
    current_candidate
  end

  def experience_params
    params.require(:experience).permit(:title, :organization, :start_date, :end_date, :present, :description, :company_size, :industry, :job_application_id)
  end
end
