class LanguagesController < ApplicationController
  skip_before_action :authenticate_recruiter!

  def new
    @language = Language.new
    authorize @language
  end

  def create
    @language = Language.new(language_params)
    authorize @language
    @language.save

    # redirection to same page
    @job_application = JobApplication.find(params[:language][:job_application_id])
    @job_offer = @job_application.job_offer
    redirect_to edit_job_offer_job_application_path(@job_offer, @job_application)
  end

  def edit
    @language = Language.find(params[:id])
    authorize @language
  end

  def update
    @language = Language.find(params[:id])
    authorize @language
    @language.update(language_params)

    # redirection to same page
    @job_application = @language.job_application
    @job_offer = @job_application.job_offer
    redirect_to edit_job_offer_job_application_path(@job_offer, @job_application)
  end

  def destroy
    @language = Language.find(params[:id])
    @job_application = @language.job_application # need job_application for redirection belowd
    authorize @language
    @language.destroy

    # redirection to same page
    # @job_application => found above through @language, before we destroy it
    @job_offer = @job_application.job_offer
    redirect_to edit_job_offer_job_application_path(@job_offer, @job_application)
  end

  private

  def pundit_user
    current_candidate
  end

  def language_params
    params.require(:language).permit(:name, :proficiency, :job_application_id)
  end
end
