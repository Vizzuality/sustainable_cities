# frozen_string_literal: true
module Abilities
  class Publisher
    include CanCan::Ability

    def initialize(user)
      can :read, :all
      cannot :read, ::Contact
      can    :create, ::Contact

      can [:activate, :deactivate], ::Comment
      can [:activate, :deactivate], ::Project
      can [:publish,  :unpublish],  ::Project
      can [:activate, :deactivate], ::User
      can [:activate, :deactivate], ::Photo
      can [:activate, :deactivate], ::Document
      can [:activate, :deactivate], ::ExternalSource
      can [:activate, :deactivate], ::Country
      can [:activate, :deactivate], ::Impact

      can :manage, ::Project, project_users: { user_id: user.id, is_owner: true }
      can :update, ::Project, project_users: { user_id: user.id                 }
      can :create, ::Project
      can [:read, :index_all, :show_project_and_bm], ::Project
      can :update, ::User,    id: user.id
      can :create, ::Comment

      can :create, ::BusinessModel
      can :update, ::BusinessModel
      can :delete, ::BusinessModel, owner_id: user.id

      cannot [:activate, :deactivate], ::User, id: user.id
    end
  end
end
