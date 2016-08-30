class JobApplicationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true # everybody from L'Oréal & the candidate can see the shows
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

  def conversations?
    true
  end

  def conversation?
    true
  end
end

