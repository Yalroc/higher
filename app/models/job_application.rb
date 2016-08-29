class JobApplication < ApplicationRecord
  has_many :languages, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :messages, dependent: :destroy

  belongs_to :candidate
  belongs_to :job_offer

end
