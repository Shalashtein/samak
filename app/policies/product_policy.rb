class ProductPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    @user.admin? or @user.fisherman?
  end

  def new?
    create?
  end

  def update?
    if @user.admin?
      true
    elsif @user.fisherman? && (@record.user_id == @user.user_id)
      true
    else
      false
    end
  end

  def edit?
    update?
  end

  def destroy?
    if @user.admin?
      true
    elsif @user.fisherman? && (@record.user_id == @user.id)
      true
    else
      false
    end
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
