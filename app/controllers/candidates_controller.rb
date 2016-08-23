class CandidatesController < ApplicationController
  before_action :set_candidate, only: [:edit, :update, :show]
  skip_before_action :authenticate_recruiter!

  def edit
  end

  def update
    @candidate.update(candidate_params)
     if @candidate.save
      redirect_to candidate_path
    else
      render :edit
    end
  end

  def show

  end

  private

  def candidate_params
    params.require(:candidate).permit(:email, :first_name, :last_name, :phone_number)
  end

  def set_candidate
    @candidate = Candidate.find(params[:id])
  end

end
