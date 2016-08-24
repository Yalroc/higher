class JobOfferPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    record.recruiter == user
  end

  def create?
    new?
  end


  def edit?
    record.recruiter == user
  end

  def update?
    edit?
  end

end
