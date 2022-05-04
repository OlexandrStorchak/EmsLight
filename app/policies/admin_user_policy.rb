class AdminUserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def index?
    user.super? || user.user?
  end

  def show?
    user.super? || user.user?
  end

  def create?
    user.super?
  end

  def new?
    create?
  end

  def update?
    user.super? || user.id == record.id
  end

  def edit?
    update?
  end

  def destroy?
    user.super? if user.id != record.id
  end
end
