class Recruiter < ApplicationRecord
  belongs_to :organization, required: false
  has_many :job_offers
  has_many :job_applications, through: :job_offers #pour la messagerie
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def self.find_for_linkedin_oauth(auth)
    current_candidate_params = auth.to_h.slice(:provider, :uid)
    current_candidate_params.merge! auth.info.slice(:email)
    # current_candidate_params[:linkedin_picture_url] = auth.info.image
    current_candidate_params[:token] = auth.credentials.token
    current_candidate_params[:token_expiry] = Time.at(auth.credentials.expires_at)

    user = self.where(provider: auth.provider, uid: auth.uid).first
    user ||= self.where(email: auth.info.email).first # User did a regular sign up in the past.
    if user
      user.update(current_candidate_params)
    else
      user = self.new(current_candidate_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end
end
