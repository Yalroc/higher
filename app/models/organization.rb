class Organization < ApplicationRecord
  has_many :educations
  has_many :recruiters
end
