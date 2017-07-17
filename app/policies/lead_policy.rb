class LeadPolicy < ApplicationPolicy
  def new?
    false
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
