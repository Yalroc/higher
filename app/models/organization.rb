class Organization < ApplicationRecord
  has_many :recruiters
  has_many :experiences
end
