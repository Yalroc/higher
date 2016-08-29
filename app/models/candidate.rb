class Candidate < ApplicationRecord
  has_many :job_applications
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, omniauth_providers: [:linkedin]

 def self.find_for_linkedin_oauth(auth)
  current_candidate_params = auth.to_h.slice(:provider, :uid)
  current_candidate_params.merge! auth.info.slice(:email, :first_name, :last_name)
  # current_candidate_params[:linkedin_picture_url] = auth.info.image
  current_candidate_params[:token] = auth.credentials.token
  current_candidate_params[:token_expiry] = Time.at(auth.credentials.expires_at)

  user = Candidate.where(provider: auth.provider, uid: auth.uid).first
  user ||= Candidate.where(email: auth.info.email).first # User did a regular sign up in the past.
  if user
    user.update(current_candidate_params)
  else
    user = Candidate.new(current_candidate_params)
    user.password = Devise.friendly_token[0,20]  # Fake password for validation
    user.save
  end

  return user
end

end
