class MessagesController < ApplicationController
  skip_before_action :authenticate_candidate!
  skip_before_action :authenticate_recruiter!

  def create
    @job_application = JobApplication.find(params[:job_application_id]) # récupérer les id job_application et de job_offer, new_message
    # @job_offer = JobOffer.find(params[:job_offer_id])                   # pour faire les redirect to
    @new_message = Message.new # on créé un nouveau message
    @message = @job_application.messages.new(message_params) # on créé un nouveau message dans une job_application
    @user = current_candidate || current_recruiter # celui qui écrit est soit un candidate soit un recruiter
    @message.author_role = @user.class.to_s #car current_ doit être une string
    authorize @message #pundit
      if @message.save
        @job_application.contact = true
        @job_application.save
        redirect_to conversation_job_application_path(@job_application)
      else
        redirect_to conversation_job_application_path(@job_application)
      end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
