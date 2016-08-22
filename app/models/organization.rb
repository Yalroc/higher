class Organization < ApplicationRecord
  has_many :educations
  has_many :recruiters
  has_many :experiences
end
