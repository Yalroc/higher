  class JobOffersController < ApplicationController
  before_action :set_job_offers, only: [:show, :edit, :update]
  skip_before_action :authenticate_candidate!

  def index
    @job_offers = JobOffer.where(recruiter: current_recruiter).all
    @job_offer = JobOffer.new
    @job_offers = policy_scope(JobOffer)

    if @job_offers.any?
      @organization = @job_offers.first.recruiter.organization
    else
      @organization = nil
    end
  end

  def show
    authorize @job_offer
  end

  def new
    @job_offer = JobOffer.new
    authorize(@job_offer) # va voir dans Pundit la policy => JobOffer#new & record = @job_offer
  end

  def create
    @job_offer = JobOffer.new(offer_params)
    @job_offer.recruiter = current_recruiter
    authorize @job_offer

    if @job_offer.save
      redirect_to job_offers_path
    else
      render :new
    end


  end

  def edit
    authorize @job_offer
  end

  def update
    authorize @job_offer

    if @job_offer.update(offer_params)
      redirect_to job_offers
    else
      render :edit
    end
  end

  private

  def pundit_user
    current_recruiter
  end

  def offer_params
    params.require(:job_offer).permit(:description)
  end

  def set_job_offers
    @job_offer = JobOffer.find(params[:id])
  end
end
