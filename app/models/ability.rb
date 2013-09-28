class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    else     
      # User Authorizations
      can :show, User,  :id => user.id   

      # Recurring Events      
      can :manage, RecurringEvent
      cannot :index, RecurringEvent
      
      # Recurring Event Follows
      can :mygames, RecEventFollow
      
      # Events
      can :show, Event
      
      #Locations
      can :show, Location
      can :edit, Location
      can :update, Location
      can :create, Location
      can :nearby, Location
      
      # User Profiles
      can :create, UserProfile, :user_id => user.id
      can :edit, UserProfile, :user_id => user.id
      can :editself, UserProfile, :user_id => user.id
      can :update, UserProfile, :user_id => user.id    
      
      # Game Types
      can :show, GameType
    end  
  end
  
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities

end
