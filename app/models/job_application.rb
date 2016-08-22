class JobApplication < ApplicationRecord
  has_many :languages
  has_many :educations

  belongs_to :candidate
  belongs_to :job_offer

end
