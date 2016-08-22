class JobApplication < ApplicationRecord
  has_many :languages
  has_many :educations
end
