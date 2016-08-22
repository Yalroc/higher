class JobApplication < ApplicationRecord
  has_many :languages
  has_many :experiences

  belongs_to :candidate
  belongs_to :job_offer
end
