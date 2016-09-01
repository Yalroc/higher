class Message < ApplicationRecord
  belongs_to :job_application

  def user
    type = author_role.downcase #????
    self.job_application.send(type)
  end
end

