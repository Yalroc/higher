class JobOffersController < ApplicationController
  before_action :set_job_offers, only: [:show, :edit, :update]
  skip_before_action :authenticate_candidate!

  def index
    @organizations = Organization.new
    # @job_offer = JobOffer.all
    # raise
    @job_offers = JobOffer.where(recruiter: current_recruiter).all
  end

  def show
  end

  def new
    @job_offer = JobOffer.new
  end

  def create
    @job_offer = JobOffer.new(offer_params)
    @job_offer.recruiter = current_recruiter

    if @job_offer.save
      redirect_to job_offers_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @job_offer.update(offer_params)
      redirect_to job_offers
    else
      render :edit
    end
  end

  private

  def offer_params
    params.require(:job_offer).permit(:description)
  end

  def set_job_offers
    @job_offer = JobOffer.find(params[:id])
  end
end
