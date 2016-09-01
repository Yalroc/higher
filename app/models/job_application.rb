class JobApplication < ApplicationRecord
  has_many :languages, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :messages, dependent: :destroy

  belongs_to :candidate
  belongs_to :job_offer

  def recruiter
    job_offer.recruiter
  end
  #permet de faire job_application.recruiter au lieu de job_application.job_offer.recruiter
end
