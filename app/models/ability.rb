class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    return unless user.present?

    can :manage, Post, user: user
    can :manage, Comment, user: user

    return unless user.admin?

    can :manage, all
  end
end
