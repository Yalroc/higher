class ExperiencePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    record.job_application.candidate == user
  end

  def create?
    new?
  end

  def edit?
    record.job_application.candidate == user
  end

  def update?
    edit?
  end

  def destroy?
    record.job_application.candidate == user
  end
end
