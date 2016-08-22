class JobOffer < ApplicationRecord
  belongs_to :recruiter
  has_many :job_applications
end
