class JobApplicationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    record.candidate == user
  end

  def edit?
    # a user cannot edit somebody else's job application && # a candidate cannot edit his or her application once it's sent
    record.candidate == user && record.submit != true
  end

  def update?
    edit?
  end

  def submit?
    record.candidate == user
  end

end
