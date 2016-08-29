class JobApplicationsController < ApplicationController

  before_action :set_job_offer, only: [:index, :edit, :update, :conversation, :batch_deletion]
  before_action :set_job_application, only: [:update, :submit, :edit, :conversation]


  skip_before_action :authenticate_recruiter!, only: [:edit, :update, :submit, :new, :conversation]
  skip_before_action :authenticate_candidate!, only: [:index, :destroy, :batch_deletion, :conversation]
  skip_after_action :verify_authorized, only: [:batch_deletion]

  def index
    @job_applications = policy_scope(JobApplication)
    @job_applications = set_job_offer.job_applications
  end

  def new
    @job_offer = JobOffer.find(params[:job_offer_id])
    if JobApplication.where(candidate: current_candidate, job_offer: @job_offer).first
      @job_application = JobApplication.where(candidate: current_candidate, job_offer: @job_offer).first
    else
      @job_application = JobApplication.new(candidate: current_candidate, job_offer: @job_offer)
      @job_application.save
    end
    authorize(@job_application)

    redirect_to edit_job_offer_job_application_path(@job_offer, @job_application)
  end

  def edit
    authorize(@job_application) # we tell Pundit to look for the authorization policies of JobApplication#edit record (once it is created)
    @experiences_sorted = @job_application.experiences.sort { |a,b| b.end_date <=> a.end_date }
    @educations_sorted = @job_application.educations.sort { |a,b| b.end_date <=> a.end_date }
    @languages = @job_application.languages

    # Data for modals
    @experience = Experience.new
    @education = Education.new
    @language = Language.new
  end

  def update
    authorize(@job_application)

    if @job_application.update(job_application_params)
      redirect_to edit_job_offer_job_application_path(@job_offer, @job_application, tab: "cover-letter")
    else
      render :edit
    end
  end

  def submit
    authorize @job_application
    @job_application.submit = true
    @job_application.save
  end


  #rajouter conversation dans les before_action
   def conversation
    authorize @job_application #pundit
    @messages = @job_application.messages #on veut les messages de la job_application dans un conversation
    @new_message = Message.new #pour l'utiliser dans sa view index
   end

  def destroy
    authorize @job_application
    @job_application.delete
  end

  def batch_deletion
    job_application_ids = params[:job_application_ids].gsub(/^,/, '').split(",")

    job_applications = @job_offer.job_applications.where(id: job_application_ids)
    job_applications.destroy_all # FIXME: DO NOT DESTROY

    respond_to do |format|
      format.html { redirect_to job_offer_job_applications_path }
    end
  end


  private

  def pundit_user
    current_candidate
  end

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

