class Conversation < ApplicationRecord
  belongs_to :candidate
  belongs_to :job_offer
end
