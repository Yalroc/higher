class JobApplicationsController < ApplicationController

  before_action :set_job_offer, only: [:show, :edit, :update, :job_applications, :batch_deletion]
  before_action :set_job_application, only: [:update, :submit, :edit, :show, :conversation]
  before_action :authenticate_recruiter_and_candidate, only: [:show]
  after_action :verify_policy_scoped, only: [:index, :job_applications], unless: :skip_pundit?

  skip_before_action :authenticate_recruiter!, only: [:edit, :update, :submit, :new, :conversation, :job_applications, :show]
  skip_before_action :authenticate_candidate!, only: [:index, :destroy, :batch_deletion, :conversation, :job_applications, :show]

  skip_after_action :verify_authorized, only: [:batch_deletion, :job_applications]



  def index
    @job_applications = policy_scope(JobApplication)
    @job_applications = set_job_offer.job_applications.where(rejected: nil, submit: true)

    @job_offer_for_navbar = JobOffer.where(recruiter: current_recruiter).first # for crappy navbar link
  end

  def show
    @job_offer_for_navbar = JobOffer.where(recruiter: current_recruiter).first
    authorize(@job_application)
    if current_recruiter
      @job_application.viewed = true
      @job_application.save
    end

    if current_candidate == @job_application.candidate || current_recruiter.organization == @job_application.job_offer.recruiter.organization
      @experiences_sorted = @job_application.experiences.sort { |a,b| b.end_date <=> a.end_date }
      @educations_sorted = @job_application.educations.sort { |a,b| b.end_date <=> a.end_date }
      @languages = @job_application.languages
    else
      redirect_to :back
    end
    @new_message = Message.new #first message modal
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

    #motivation letter placeholder
    @sample_letter = return_sample_letter
  end

  def update
    authorize(@job_application)

    if @job_application.update(job_application_params)
      redirect_to edit_job_offer_job_application_path(@job_offer, @job_application, tab: "cover-letter", modal: true)
    else
      render :edit
    end
  end

  def submit
    # job offers to show when you submit
    @job_offers = JobOffer.all
    authorize @job_application
    @job_application.submit = true
    @job_application.save
  end

  # def conversations
  #   @job_applications = policy_scope(JobApplication) #afficher toutes mes job_applications
  #   authorize @job_applications # pundit
  #   @new_message = Message.new
  # end

  #rajouter conversation  et job_applications dans les before_action, skip et after_action
  def conversation #afficher une conversation + en créé une
    @job_offer_for_navbar = JobOffer.where(recruiter: current_recruiter).first
    authorize @job_application # pundit
      @job_applications = current_user.job_applications # on veut tous les messages du current_user
      @messages = @job_application.messages #on veut tous les messages de la job_application dans une conversation
      @new_message = Message.new
  end

  def destroy
    authorize @job_application
    @job_application.delete
  end

  def batch_deletion
    job_application_ids = params[:job_application_ids].gsub(/^,/, '').split(",")

    job_applications = @job_offer.job_applications.where(id: job_application_ids)
    job_applications.each do |job_application|
      job = job_application
      job.rejected = true
      job.save
    end

    respond_to do |format|
      format.html { redirect_to job_offer_job_applications_path }
    end
  end

  private

  def authenticate_recruiter_and_candidate
    :authenticate_recruiter! || :authenticate_candidate!
  end

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

  def return_sample_letter
    "Dear Sir or Madam,

I was excited to see your opening for a customer service rep, and I hope to be invited for an interview.My background includes serving as a customer service associate within both call-center and retail environments. Most recently, I worked on the customer service desk for Discount-Mart, where my responsibilities included handling customer merchandise returns, issuing refunds/store credits, flagging damaged merchandise for shipment back to vendors and providing back-up cashiering during busy periods.

Previously, I worked within two high-volume customer-support call centers for a major telecommunications carrier and a satellite television services provider. In these positions, I demonstrated the ability to resolve a variety of issues and complaints (such as billing disputes, service interruptions or cutoffs, repair technician delays/no-shows and equipment malfunctions). I consistently met my call-volume goals, handling an average of 56 to 60 calls per day.

In addition to this experience, I gained considerable customer service skills during my part-time employment as a waitress and restaurant hostess while in high school.

I also bring to the table strong computer proficiencies in MS Word, MS Excel and CRM database applications and a year of college (business major). Please see the accompanying resume for details of my experience and education.

Sincerely,"
  end



end

