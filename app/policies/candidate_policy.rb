class CandidatePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def edit?
    record == user # will return true or false
  end

  def update?
    edit?
  end

end
