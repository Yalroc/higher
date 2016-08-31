class JobOffer < ApplicationRecord
  belongs_to :recruiter, required: false
  has_many :job_applications

end
