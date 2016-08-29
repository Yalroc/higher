class CandidatesController < ApplicationController
  before_action :set_candidate, only: [:edit, :update, :show]
  skip_before_action :authenticate_recruiter!
  skip_before_action :verify_authenticity_token

  def edit
    authorize @candidate
  end

  def update
    authorize @candidate

    @candidate.update(candidate_params)
     if @candidate.save
      redirect_to edit_candidate_path
    else
      render :edit
    end
  end

  def show
    authorize @candidate
  end

  private

  def pundit_user
    current_candidate
  end


  def candidate_params
    params.require(:candidate).permit(:email, :first_name, :last_name, :phone_number)
  end

  def set_candidate
    @candidate = Candidate.find(params[:id])
  end

end
