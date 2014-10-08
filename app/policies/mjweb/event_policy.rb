module Mjweb
  class EventPolicy < Struct.new(:user, :event)
    def owned
      #if user has role of admin or owner
      if user.admin?
        #return events that have same company_id as the current_user
        event.company_id == user.company_id
      end
    end
        
    def index?
      owned
    end
    
    def show?
      index?
    end
    
    def new?
      user.admin?
    end 
    
    def create?
      user.admin?
    end    

    def edit?
      owned
    end
    
    def update?
      edit?
    end
    
    def delete?
      owned
    end    
        
  end
end