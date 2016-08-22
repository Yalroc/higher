class Experience < ApplicationRecord
  belongs_to :organization
  belongs_to :job_application
end
