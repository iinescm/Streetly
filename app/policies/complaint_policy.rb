class ComplaintPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

def create?
    true
  end

  def show?
    true
  end

  def edit?
    true
  end

  # only the user who created the complaint is allowed to update it
  def update?
    true
    # user - this is the current user
    # record - this is the complaint in this case because its a complaintPolicy
    user_is_owner?
  end

  # only the user who created the complaint is allowed to delete it
  def destroy?
    # user - this is the current user
    # record - this is the complaint in this case because its a complaintPolicy
    user_is_owner?
  end

  private

  def user_is_owner?
    record.user == user
  end
end
