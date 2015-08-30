class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user
    can(:manage, user)
  end
end
