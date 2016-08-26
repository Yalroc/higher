class JobApplicationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    # user = current_candidate  => automatically given by Pundit
    # record = @job_application => automatically given by Pundit
    record.candidate == user
  end

  def update?
    edit?
  end

  def submit?
    record.candidate == user
  end

end
