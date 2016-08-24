class JobOfferPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
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
