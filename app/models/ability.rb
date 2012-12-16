# Defines +User+ abilities.
# It uses +CanCan::Ability+.
# Check the +Role+ model for more details about roles.
class Ability
  include CanCan::Ability

  # Receives an +User+
  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)

    # By default, root can do anything
    # But in reality, it just manage Companies
    if user.root?
      can :manage, :all
    end

    if user.cashier?
      can :read, Promotion, :company_id => user.employee.try(:company_id)
      can :manage, Point
      can :read, Company, :id => user.employee.try(:company_id)
      can :balance, Client
    end

    if user.admin?
      can :manage, Promotion, :user_id => user.id
      can :manage, Point
      can :manage, Employee, :company_id => user.employee.try(:company_id)
      can [:edit,:read,:update], Company, :id => user.employee.try(:company_id)
    end

    if user.client?
      can [:manage, :points], Client, :user_id => user.id
    end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
