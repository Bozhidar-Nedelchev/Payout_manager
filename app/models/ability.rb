# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
   user ||= User.new # Guest user

    if user.admin?
      can :manage, :all
    elsif user.sales?
      can :read, [Country, Client, Merchant, Brand, Product, Application]
      # Define other permissions for the sales role as needed
    else
      # Define permissions for other roles or the default (guest) role
      # For example, allow guests to read countries:
      can :read, [Country, Client, Merchant, Brand, Product, Application]
    end
  end
end
