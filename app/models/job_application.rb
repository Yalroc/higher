class JobApplication < ApplicationRecord
  has_many :languages
  belongs_to :candidate
  belongs_to :job_offer
end
